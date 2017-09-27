class Notification < ApplicationRecord
  belongs_to :todo

  validate :notify_in_the_future

  private

  def notify_in_the_future
    errors.add(:notify_at, "can't be in the past") if notify_at < Time.now
  end
end
