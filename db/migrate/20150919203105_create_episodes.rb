class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :series_id, null: false
      t.integer :episode_id, null: false
      t.string :name, null: false
      t.integer :number, null: false
      t.date :first_aired_at, null: false
      t.text :guest_stars
      t.text :description
      t.string :banner_path, null: false
      t.integer :season_id
      t.integer :thumb_height
      t.integer :thumb_width
      t.string :director
      t.string :imdb_id
      t.timestamps null: false
    end

    add_index :episodes, :series_id
  end
end
