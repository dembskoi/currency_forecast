module API
  class HistoricalCurrencyRate < Request
    def self.by_date(date, base = nil)
      request_url = '/' + date.to_s
      params = base ? { base: base } : {}
      new(request_url, params).call
    end
  end
end
