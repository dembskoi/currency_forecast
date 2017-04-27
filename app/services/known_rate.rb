class KnownRate
  include YearAndWeek
  attr_reader :base_currency, :weeks_count, :rates_from_db

  def initialize(base_currency, weeks_count)
    @base_currency = base_currency
    @weeks_count = weeks_count
  end

  def rates
    @rates_from_db = CurrencyRate.rates(base_currency.id, weeks_count)
    if rates_from_db.size == weeks_count
      rates_from_db.order(:year, :week)
    else
      (rates_from_api + rates_from_db).sort_by { |r| [r.year, r.week] }
    end
  end

  private

  def rates_from_api
    rates = []
    years_weeks_each(weeks_count) do |year, week|
      next if rates_from_db.any? { |rate| rate.base_currency_id == base_currency.id && rate.year == year && rate.week == week }
      response = API::HistoricalCurrencyRate.by_date(Date.commercial(year, week), base_currency.code)
      if response.success?
        rates << CurrencyRate.new(base_currency_id: base_currency.id,
                                  year: year,
                                  week: week,
                                  rates: response.data['rates'])
      else
        sleep(1) && redo
      end
    end
    CurrencyRate.where(id: CurrencyRate.import(rates).ids)
  end
end
