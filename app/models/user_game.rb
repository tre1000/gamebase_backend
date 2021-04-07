class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def game_info
    user_game = UserGame.find(id)
    return game_info = Game.find(user_game[:game_id])
  end
end
