module ApiAi
  class OutputGenerator
    ACTION_HANDLERS = {
      default: ActionHandlers::DefaultOutput
    }.freeze

    def initialize parsed_response
      @parsed_response = parsed_response
    end

    def call
      action_handler.new(@parsed_response).call
    end

    private

    def action_handler
      ACTION_HANDLERS[@parsed_response[:action_handler]] || ACTION_HANDLERS[:default]
    end
  end
end