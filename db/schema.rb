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

ActiveRecord::Schema.define(version: 20150329065407) do

  create_table "challenges", force: :cascade do |t|
    t.string   "title"
    t.text     "task"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "endDate"
    t.float    "money"
  end

  add_index "challenges", ["user_id", "created_at"], name: "index_challenges_on_user_id_and_created_at"
  add_index "challenges", ["user_id"], name: "index_challenges_on_user_id"

  create_table "challenges_users", id: false, force: :cascade do |t|
    t.integer "challenge_id"
    t.integer "user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "challenge_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "relationships", ["challenge_id"], name: "index_relationships_on_challenge_id"
  add_index "relationships", ["user_id", "challenge_id"], name: "index_relationships_on_user_id_and_challenge_id", unique: true
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
