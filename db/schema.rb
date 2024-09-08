# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_09_08_061501) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "monsters", force: :cascade do |t|
    t.string "name", null: false
    t.text "body", null: false
    t.string "start_battle_image_url"
    t.string "end_battle_image_url"
    t.string "bestiary_monster_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_monsters_on_name", unique: true
  end

  create_table "quests", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.bigint "monster_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["monster_id"], name: "index_quests_on_monster_id"
    t.index ["title"], name: "index_quests_on_title", unique: true
  end

  create_table "user_authentications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_user_authentications_on_provider_and_uid", unique: true
    t.index ["user_id"], name: "index_user_authentications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", limit: 10, null: false
    t.integer "hunterrank", default: 1
    t.string "gender", default: "male", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "quests", "monsters"
  add_foreign_key "user_authentications", "users"
end
