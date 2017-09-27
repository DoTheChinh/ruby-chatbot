class User < ApplicationRecord
  has_many :todos, dependent: :destroy
  has_many :notifications, through: :todos
end
