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

ActiveRecord::Schema.define(version: 20190330135501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.string "name"
    t.time "event_date"
    t.string "title"
    t.string "max_users_count"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_cards_on_category_id"
    t.index ["users_id"], name: "index_cards_on_users_id"
  end

  create_table "cards_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.bigint "cards_id"
    t.index ["cards_id"], name: "index_cards_users_on_cards_id"
    t.index ["users_id", "cards_id"], name: "index_cards_users_on_users_id_and_cards_id", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_users", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "tags_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tags_id"], name: "index_tags_users_on_tags_id"
    t.index ["users_id"], name: "index_tags_users_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cards", "categories"
  add_foreign_key "cards_users", "cards", column: "cards_id"
  add_foreign_key "cards_users", "users", column: "users_id"
end
