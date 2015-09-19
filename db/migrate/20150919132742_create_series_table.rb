class CreateSeriesTable < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name
      t.integer :series_id, null: false
      t.string :banner_path,  null: false
      t.text :description, null: false, limit: 1000
      t.date :first_aired_at, null: false
      t.string :imdb_id, null: false
      t.string :network, null: false
      t.timestamps null: false
    end

    add_index :series, :series_id
  end
end
