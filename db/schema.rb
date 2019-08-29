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

ActiveRecord::Schema.define(version: 2019_08_29_182214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "message_threads", force: :cascade do |t|
    t.string "thread_owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "id_request"
  end

  create_table "messages", force: :cascade do |t|
    t.string "thread_id"
    t.string "message_author"
    t.datetime "date"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", default: "normal"
  end

  create_table "participants", force: :cascade do |t|
    t.string "id_request"
    t.string "user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "user_id"
    t.string "request_type"
    t.text "description"
    t.date "date"
    t.integer "required_people"
    t.string "x"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "y"
  end

  create_table "thread_users", id: false, force: :cascade do |t|
    t.string "thread_id"
    t.string "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.string "username"
    t.string "address"
    t.string "idcard"
    t.string "firstname"
    t.string "lastname"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
