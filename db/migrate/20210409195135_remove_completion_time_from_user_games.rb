class RemoveCompletionTimeFromUserGames < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_games, :completion_time
    add_column :user_games, :completion_hours, :integer
    add_column :user_games, :completion_minutes, :integer
  end
end
