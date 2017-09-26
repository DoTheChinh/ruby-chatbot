module ActionHandlers
  class ActionHandlerBase
    def initialize parsed_response
      @parsed_response = parsed_response
    end

    def call
      raise NotImplementedError
    end
  end
end