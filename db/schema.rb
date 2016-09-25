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

ActiveRecord::Schema.define(version: 20160925200134) do

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "place_type"
    t.string   "neighborhood"
    t.string   "address"
    t.text     "comments"
    t.boolean  "wifi"
    t.string   "wifi_quality"
    t.boolean  "public_restroom"
    t.string   "restroom_cleanliness"
    t.boolean  "costs_money"
    t.string   "available_for_purchase"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end