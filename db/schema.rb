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

ActiveRecord::Schema.define(version: 20150825212603) do

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.text     "auth_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  add_index "authentications", ["provider"], name: "index_authentications_on_provider"
  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id"

  create_table "monster_types", force: :cascade do |t|
    t.string   "type_name"
    t.integer  "type_weakness"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "monster_types", ["type_name"], name: "index_monster_types_on_type_name"
  add_index "monster_types", ["type_weakness"], name: "index_monster_types_on_type_weakness"

  create_table "monsters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "monster_type_id"
    t.string   "monster_name"
    t.integer  "monster_power"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "monsters", ["monster_name"], name: "index_monsters_on_monster_name"
  add_index "monsters", ["monster_power"], name: "index_monsters_on_monster_power"
  add_index "monsters", ["monster_type_id"], name: "index_monsters_on_monster_type_id"
  add_index "monsters", ["team_id"], name: "index_monsters_on_team_id"
  add_index "monsters", ["user_id"], name: "index_monsters_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "team_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["team_name"], name: "index_teams_on_team_name"
  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["full_name"], name: "index_users_on_full_name"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
