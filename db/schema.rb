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

ActiveRecord::Schema.define(version: 20180803233457) do

  create_table "categories", force: :cascade do |t|
    t.text "name"
  end

  create_table "counties", force: :cascade do |t|
    t.text "name"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "county_id"
    t.text    "city"
    t.text    "zip"
    t.text    "locality"
  end

  create_table "organizations", force: :cascade do |t|
    t.text    "name"
    t.text    "address"
    t.text    "phone"
    t.text    "email"
    t.text    "website"
    t.integer "user_id"
    t.integer "category_id"
    t.integer "location_id"
    t.text    "account"
    t.text    "description"
    t.integer "aggregate_rank"
    t.integer "daily_rank"
    t.integer "tag1"
    t.integer "tag2"
    t.integer "tag3"
    t.integer "tag4"
  end

  create_table "tags", force: :cascade do |t|
    t.text "name"
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "nickname"
    t.text "email"
    t.text "password_digest"
    t.text "title"
  end

end
