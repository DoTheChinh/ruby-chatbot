module ActionHandlers
  class TodoCreate < ActionHandlerBase

    def call
      current_user = User.where(psid: @parsed_response[:psid]).first_or_create!
      todo = Todo.create(item: @parsed_response.dig(:parameters, :item), user: current_user)
      if todo.persisted?
        {
          text: 'Item successfully added to Your list.'
        }
      else
        {
          text: 'Something went wrong, please try once again. Sorry!'
        }
      end
    end
  end
end
