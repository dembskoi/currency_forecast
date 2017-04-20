module API
  class HistoricalCurrencyRate < Request
    class << self
      def latest(base = nil)
        request_url = '/latest'
        params = base ? { base: base } : {}
        new(request_url, params).call
      end

      def by_date(date, base = nil)
        request_url = '/' + date.to_s
        params = base ? { base: base } : {}
        new(request_url, params).call
      end
    end
  end
end
