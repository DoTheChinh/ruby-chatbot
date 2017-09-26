module ApiAi
  class ResponseParser
    def initialize response
      @response = response
    end

    def call
      return unless @response.present?

      {
        psid: @response.dig('sessionId'),
        output: @response.dig('result', 'fulfillment', 'speech'),
        parameters: @response.dig('result', 'parameters'),
        action: @response.dig('result', 'action'),
        action_incomplete: @response.dig('result', 'actionIncomplete')
      }
    end
  end
end
