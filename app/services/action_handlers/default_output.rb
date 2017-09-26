module ActionHandlers
  class DefaultOutput < ActionHandlerBase

    def call
      {
        text: @parsed_response[:output]
      }
    end
  end
end