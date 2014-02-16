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

ActiveRecord::Schema.define(version: 20140216023819) do

  create_table "bottles", force: true do |t|
    t.integer  "quantity"
    t.decimal  "price"
    t.integer  "rating"
    t.string   "comment"
    t.integer  "wine_id"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bottles", ["store_id"], name: "index_bottles_on_store_id"
  add_index "bottles", ["wine_id"], name: "index_bottles_on_wine_id"

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "varieties", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wines", force: true do |t|
    t.integer  "brand_id"
    t.integer  "variety_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wines", ["brand_id"], name: "index_wines_on_brand_id"
  add_index "wines", ["variety_id"], name: "index_wines_on_variety_id"

end
