class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.text :box_art
      t.text :about
      t.string :platforms
      t.string :multiplayer
      t.string :esrb_rating
      t.string :content_description
      t.decimal :avg_user_rating, precision: 2, scale: 2
      t.string :developer
      t.string :publisher

      t.timestamps
    end
  end
end
