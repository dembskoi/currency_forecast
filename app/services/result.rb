class Result
  extend YearAndWeek

  attr_reader :year, :week, :amount, :rate
  attr_accessor :rank

  def initialize(year, week, amount, rate)
    @year = year
    @week = week
    @amount = amount
    @rate = rate
  end

  def exchange_sum
    amount * rate
  end

  def self.all(calculation)
    known_rates = KnownRate.new(calculation.base_currency, calculation.max_waiting_time).rates

    results = []
    years_weeks_each(calculation.max_waiting_time) do |year, week|
      rate = 1
      results << new(year, week, calculation.amount, rate)
    end

    results
  end
end
