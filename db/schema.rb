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

ActiveRecord::Schema.define(version: 20180404195149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grocery_items", force: :cascade do |t|
    t.bigint "grocery_list_id"
    t.string "name"
    t.boolean "crossed_off"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grocery_list_id"], name: "index_grocery_items_on_grocery_list_id"
  end

  create_table "grocery_lists", force: :cascade do |t|
    t.string "title"
    t.string "owner"
    t.string "last_modified_by"
    t.datetime "created_at", null: false
    t.datetime "last_modified"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "grocery_items", "grocery_lists"
end
