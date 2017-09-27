class User < ApplicationRecord
  has_many :todos
  has_many :notifications, through: :todos
end
