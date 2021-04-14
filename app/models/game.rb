class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games

  def avg_completion_time
    #searches for user_games instances where the status is completed and the game_id is equal to the id of the current instance of game.
    user_games = UserGame.where("game_id = ? AND status ILIKE ?", "#{id}", "completed")

    #this breaks the total completion time for each game into minutes and adds it to total_time_in_minutes
    total_time_in_minutes = 0
    user_games.each do |x|
      total_time_in_minutes += x["completion_hours"] * 60
      total_time_in_minutes += x["completion_minutes"]
    end

    avg_time_in_minutes = total_time_in_minutes / user_games.length
    avg_minutes = avg_time_in_minutes % 60
    avg_hours = (avg_time_in_minutes - avg_minutes) / 60

    return "#{avg_hours} hours, #{avg_minutes} minutes"
  end
end
