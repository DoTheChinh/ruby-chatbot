module ActionHandlers
  class TodoIndex < ActionHandlerBase

    def call
      current_user = User.where(psid: @parsed_response[:psid]).first_or_create!
      @todos = current_user.todos
      if @todos.present?
        {
          text: todos_serialized
        }
      else
        {
          text: 'You have nothing to do.'
        }
      end
    end

    def todos_serialized
      @todos.pluck(:item).join("\n") #always use double quotes for endl symbol
    end
  end
end
