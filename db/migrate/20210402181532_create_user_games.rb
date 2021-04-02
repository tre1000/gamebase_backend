class CreateUserGames < ActiveRecord::Migration[6.1]
  def change
    create_table :user_games do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :status
      t.string :completion_time
      t.integer :rating
      t.text :review

      t.timestamps
    end
  end
end
