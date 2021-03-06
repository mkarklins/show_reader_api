# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150919203105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.integer  "series_id"
    t.integer  "episode_id",     null: false
    t.string   "name",           null: false
    t.integer  "number",         null: false
    t.date     "first_aired_at", null: false
    t.text     "guest_stars"
    t.text     "description"
    t.string   "banner_path",    null: false
    t.integer  "season_id"
    t.integer  "thumb_height"
    t.integer  "thumb_width"
    t.string   "director"
    t.string   "imdb_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "episodes", ["series_id"], name: "index_episodes_on_series_id", using: :btree

  create_table "series", force: :cascade do |t|
    t.string   "name"
    t.integer  "series_id",      null: false
    t.string   "banner_path",    null: false
    t.text     "description",    null: false
    t.date     "first_aired_at", null: false
    t.string   "imdb_id",        null: false
    t.string   "network",        null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "series", ["series_id"], name: "index_series_on_series_id", using: :btree

end
