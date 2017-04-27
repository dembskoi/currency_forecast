class CurrencyRate < ApplicationRecord
  extend YearAndWeek

  belongs_to :base_currency, class_name: 'Currency'

  validates :year, :week, :rates, presence: true
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 2010, less_than_or_equal_to: 2050 }
  validates :week, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 53 }

  def self.rates(base_currency_id, weeks_count)
    finish_year, finish_week = year_and_week_by_date(Date.today)
    start_year, start_week = year_and_week_by_date(Date.today - (weeks_count - 1).weeks)

    conditions = []
    table = arel_table
    (start_year..finish_year).each do |year|
      start_week_in_year = year == start_year ? start_week : 1
      finish_week_in_year = year == finish_year ? finish_week : weeks_count_by_year(year)
      conditions << table[:year].eq(year).and(table[:week].in((start_week_in_year..finish_week_in_year).to_a))
    end

    where(base_currency_id: base_currency_id).where(conditions.inject { |where, condition| where.or(condition) })
  end
end
