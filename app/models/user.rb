class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
