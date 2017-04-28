module YearAndWeek
  def weeks_count_by_year(year)
    last_day = Date.new(year).end_of_year
    last_day.cweek == 1 ? last_day.prev_week.cweek : last_day.cweek
  end

  def year_and_week_by_date(date)
    [date.year, date.cweek]
  end

  def years_weeks_each(start_date, finish_date)
    start_year, start_week = year_and_week_by_date(start_date)
    finish_year, finish_week = year_and_week_by_date(finish_date)
    (start_year..finish_year).each do |year|
      start_week_in_year = year == start_year ? start_week : 1
      finish_week_in_year = year == finish_year ? finish_week : weeks_count_by_year(year)

      (start_week_in_year..finish_week_in_year).each do |week|
        yield year, week
      end
    end
  end
end
