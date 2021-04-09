class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :game_id, presence: true

  def game_info
    user_game = UserGame.find(id)
    return game_info = Game.find(user_game[:game_id])
  end

  # this will create a unique array out of the user id and the game id to ensure that a user can't accidentally create two UserGame instances of the same game

  # def instance_tuple
  # end
end
