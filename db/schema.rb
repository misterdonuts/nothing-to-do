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

ActiveRecord::Schema.define(version: 2019_01_10_134123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authorizations_on_provider_and_uid", unique: true
  end

  create_table "group_invitations", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.integer "receiver_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_relations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitation_relations", force: :cascade do |t|
    t.integer "invitation_id"
    t.integer "sender_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
  end

  create_table "invitations", force: :cascade do |t|
    t.text "contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.datetime "time_limit", null: false
    t.integer "remain_minutes"
    t.integer "is_decided"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "user_name"
    t.integer "invite_num", default: 0
    t.integer "be_invited_num", default: 0
    t.integer "accept_num", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "image"
    t.integer "is_free", default: 1
    t.string "account_name"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
