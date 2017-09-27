class Notification < ApplicationRecord
  belongs_to :todo
  delegate :user, to: :todo

  validate :notify_in_the_future

  after_create :schedule_notification

  private

  def notify_in_the_future
    errors.add(:notify_at, "can't be in the past") if notify_at < Time.now
  end

  def schedule_notification
    SendNotificationWorker.perform_at(notify_at, id)
  end
end
