module ActionHandlers
  class DefaultOutput < ActionHandlerBase

    def call
      @parsed_response[:output]
    end
  end
end