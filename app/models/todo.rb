class Todo < ApplicationRecord
  belongs_to :user, optional: true
  has_many :notifications

  validates_presence_of :item
end
