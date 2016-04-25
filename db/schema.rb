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

ActiveRecord::Schema.define(version: 20160425201942) do

  create_table "genres", force: :cascade do |t|
    t.string "genre"
  end

  create_table "movies", force: :cascade do |t|
    t.string  "title"
    t.integer "year"
  end

  create_table "ratings", force: :cascade do |t|
    t.string "stars"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "reviews"
  end

  create_table "studios", force: :cascade do |t|
    t.string "studios"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
  end

end
