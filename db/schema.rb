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

ActiveRecord::Schema.define(version: 20180517111356) do

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "faculty_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "greads", force: :cascade do |t|
    t.integer  "gread",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "lesson_users", force: :cascade do |t|
    t.integer  "lesson_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "lesson_users", ["lesson_id", "user_id"], name: "index_lesson_users_on_lesson_id_and_user_id", unique: true, using: :btree

  create_table "lessons", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "room_number",           limit: 255
    t.string   "textbook",              limit: 255
    t.string   "referencebook",         limit: 255
    t.integer  "piriod",                limit: 4
    t.string   "wday",                  limit: 255
    t.integer  "unit",                  limit: 4
    t.integer  "lesson_information_id", limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "department_id",         limit: 4
    t.integer  "faculty_id",            limit: 4
    t.integer  "gread_id",              limit: 4
    t.integer  "teacher_id",            limit: 4
    t.integer  "term_id",               limit: 4
    t.integer  "year_id",               limit: 4
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "terms", force: :cascade do |t|
    t.string   "term",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "faculty_id",             limit: 4
    t.integer  "department_id",          limit: 4
    t.integer  "permission",             limit: 4
    t.string   "name",                   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "gread_id",               limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "years", force: :cascade do |t|
    t.integer  "year",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
