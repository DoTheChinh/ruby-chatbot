module ActionHandlers
  class TodoCreate < ActionHandlerBase

    def call
      current_user = User.where(psid: @parsed_response[:psid]).first_or_create!
      todo = Todo.create(item: @parsed_response.dig(:parameters, :item), user: current_user)
      if todo.persisted?
        todo.notifications.create(notify_at: notify_time) if time_given?
        {
          text: 'Item successfully added to Your list.'
        }
      else
        {
          text: 'Something went wrong, please try once again. Sorry!'
        }
      end
    end

    private

    def notify_time
      @notify_time ||= DateTime.parse time_param
    end

    def time_given?
      time_param.present? && time_param != 'refused'
    end

    def time_param
      @time_param ||= @parsed_response.dig(:parameters, :notify_at, :datetime)
    end
  end
end
