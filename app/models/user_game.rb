class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :game_id, presence: true
  validates :status, presence: true
  validates :instance, uniqueness: true

  def game_info
    @user_game = UserGame.find(id)
    return game_info = Game.find(@user_game[:game_id])
  end
end
