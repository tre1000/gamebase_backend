class RemoveAvgUserRatingFromGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :avg_user_rating
  end
end
