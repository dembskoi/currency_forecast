class ForecastRate
  attr_reader :known_rates, :target_currency_code

  def initialize(known_rates, target_currency)
    @known_rates = known_rates.map(&:rates)
    @target_currency_code = target_currency.code
  end

  def rates
    forecast_rates = []
    @known_rates.count.times do
      forecast_rates << rand(min_rate..max_rate).round(count_of_decimal)
    end

    forecast_rates
  end

  private

  def max_rate
    @max_rate ||= known_rates.map { |r| r[target_currency_code] }.max.to_f
  end

  def min_rate
    @min_rate ||= known_rates.map { |r| r[target_currency_code] }.min.to_f
  end

  def count_of_decimal
    @count_of_decimal ||= begin
      first_rate = known_rates.first[target_currency_code].to_s
      first_rate.include?('.') ? first_rate.split('.').last.size : 0
    end
  end
end
