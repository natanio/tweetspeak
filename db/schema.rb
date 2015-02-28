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

ActiveRecord::Schema.define(version: 20150228045913) do

  create_table "card_definitions", id: false, force: true do |t|
    t.integer "card_id"
    t.integer "definition_id"
  end

  add_index "card_definitions", ["card_id"], name: "index_card_definitions_on_card_id"
  add_index "card_definitions", ["definition_id"], name: "index_card_definitions_on_definition_id"

  create_table "cards", force: true do |t|
    t.string   "title"
    t.integer  "lesson_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hint_id"
    t.integer  "keyphrase_id"
    t.datetime "learned_at"
  end

  create_table "courses", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course_image_file_name"
    t.string   "course_image_content_type"
    t.integer  "course_image_file_size"
    t.datetime "course_image_updated_at"
    t.integer  "starting_lesson"
    t.integer  "ending_lesson"
  end

  create_table "definitions", force: true do |t|
    t.string   "title"
    t.integer  "keyphrase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
  end

  create_table "hints", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "card_id"
    t.integer  "keyphrase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keyphrases", force: true do |t|
    t.string   "title"
    t.integer  "lesson_id"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hint_id"
  end

  create_table "languages", force: true do |t|
    t.string "name"
    t.string "english_name"
  end

  create_table "learning_sessions", force: true do |t|
    t.integer  "user_id"
    t.integer  "card_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", force: true do |t|
    t.string   "title"
    t.string   "tags"
    t.text     "text"
    t.text     "audio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "video"
    t.text     "answer"
    t.text     "tweet"
    t.text     "pronunciation"
    t.integer  "lesson_order"
    t.integer  "course_id"
  end

  create_table "tracks", force: true do |t|
    t.integer "user_id"
    t.integer "lesson_id"
    t.string  "track_url"
  end

  create_table "user_courses", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "last_lesson"
    t.datetime "course_finished"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin"
    t.integer  "best_streak",            default: 0
    t.boolean  "active_subscription"
    t.integer  "last_lesson",            default: 0
    t.string   "customer_id",            default: ""
    t.integer  "streak",                 default: 0
    t.integer  "points",                 default: 0
    t.integer  "last_calculated_streak", default: 0
    t.boolean  "trialing",               default: true
    t.datetime "trial_began"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "language_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
