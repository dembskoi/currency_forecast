class Result
  extend YearAndWeek

  attr_reader :year, :week, :amount, :rate, :target_currency_code
  attr_accessor :rank

  def initialize(year, week, amount, rate, target_currency_code)
    @year = year
    @week = week
    @amount = amount
    @rate = rate
    @target_currency_code = target_currency_code
  end

  def exchange_sum
    amount * rate
  end

  class << self
    def all(calculation)
      known_rates = KnownRate.new(calculation.base_currency, calculation.max_waiting_time).rates
      forecast_rates = ForecastRate.new(known_rates, calculation.target_currency).rates

      results = []
      years_weeks_each(Date.today.next_week, Date.today + calculation.max_waiting_time.weeks) do |year, week|
        results << new(year, week, calculation.amount, forecast_rates.shift, calculation.target_currency.code)
      end
      max_ranks(results)

      results
    end

    private

    def max_ranks(results)
      results.sort_by(&:exchange_sum).reverse.take(3).each { |r| r.rank = 'Max Profit' }
    end
  end
end
