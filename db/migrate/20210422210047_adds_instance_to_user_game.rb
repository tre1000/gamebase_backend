class AddsInstanceToUserGame < ActiveRecord::Migration[6.1]
  def change
    add_column :user_games, :instance, :string
  end
end
