class SendNotificationWorker
  include Sidekiq::Worker
  include Facebook::Messenger

  def perform(notification_id)
    notification = Notification.find(notification_id)
    if notification
      Bot.deliver({
                    recipient: {
                      id: notification.user.psid
                    },
                    message: {
                      text: "Remember to #{notification.todo.item}"
                    }
                  }, access_token: ENV['ACCESS_TOKEN'])
      notification.destroy
    end
  end
end
