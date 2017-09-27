class Todo < ApplicationRecord
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates_presence_of :item
end
