module ApiAi
  class RequestSender
    def initialize params
      @params = default_params.merge params
      camelize_keys
    end

    def call
      perform_request
      bad_request? ? nil : @response
    end

    private

    def default_params
      {
        lang: 'en',
        v: '20170926'
      }
    end

    def camelize_keys
      @params.transform_keys! do |key|
        key.to_s.camelize(:lower).to_sym
      end
    end

    def perform_request
      @response ||= HTTP.auth("Bearer #{ENV['API_AI_CLIENT_ACCESS_TOKEN']}").get("#{ENV['API_AI_URL']}query", params: @params).parse
      #to symbolize keys use JSON.parse(symbolize_names: true)
    end

    def bad_request?
      !@response.dig('status', 'code').to_s.start_with? '2'
    end
  end
end
