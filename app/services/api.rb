module API
  module Logger
    def logger
      @logger ||= ::Logger.new(ENV['LOGGER_OUTPUT'] || STDOUT)
    end
  end

  class Success
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def success?
      true
    end
  end

  class Error
    attr_reader :data, :error_message

    def initialize(error_message)
      @error_message = error_message
      @data = {}
    end

    def success?
      false
    end
  end

  class Request
    include Logger

    API_ENDPOINT = 'http://api.fixer.io'.freeze

    attr_reader :connection, :request_url, :params

    def initialize(request_url, params = {})
      @connection = Faraday.new(url: API_ENDPOINT)
      @request_url = request_url
      @params = params
    end

    def analyze_response(data)
      if data['error']
        logger.error "url: #{request_url}, message: #{data['error']}, params: #{params}"
        Error.new(data['error'])
      else
        logger.info "url: #{request_url}, response: #{data.inspect}, params: #{params}"
        Success.new(data)
      end
    end

    def response_body(response)
      analyze_response JSON.parse(response.body)
    rescue JSON::ParserError => e
      logger.error "url: #{request_url}, message: #{e.message}, params: #{params}"
      Error.new(e.message)
    end

    def call
      response_body connection.get(request_url, params)
    rescue Errno::ETIMEDOUT, Faraday::Error => e
      logger.error "url: #{request_url}, message: #{e.message}, params: #{params}"
      Error.new(e.message)
    end
  end
end
