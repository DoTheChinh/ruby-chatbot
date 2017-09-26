module ApiAi
  class OutputGenerator
    ACTION_HANDLERS = {
      default: ActionHandlers::DefaultOutput,
      create_todo: ActionHandlers::TodoCreate
    }.freeze

    def initialize parsed_response
      @parsed_response = parsed_response
    end

    def call
      action_handler.new(@parsed_response).call
    end

    private

    def action_handler
      if @parsed_response[:action_incomplete]
        ACTION_HANDLERS[:default]
      else
        ACTION_HANDLERS[@parsed_response[:action]] || ACTION_HANDLERS[:default]
      end
    end
  end
end