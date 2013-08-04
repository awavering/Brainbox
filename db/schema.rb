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

ActiveRecord::Schema.define(version: 201212060159121) do

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.datetime "due"
    t.datetime "late"
    t.string   "category"
    t.string   "description"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendar_events", force: true do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "children_users", id: false, force: true do |t|
    t.integer "child_id"
    t.integer "user_id"
  end

  create_table "comments", force: true do |t|
    t.string   "contents"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parents_users", id: false, force: true do |t|
    t.integer "parent_id"
    t.integer "user_id"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "logo"
    t.string   "style"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools_users", id: false, force: true do |t|
    t.integer "school_id"
    t.integer "user_id"
  end

  create_table "sections", force: true do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "finish"
    t.string   "location"
    t.integer  "capacity"
    t.string   "description"
    t.string   "announcements"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students_sections", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "section_id"
  end

  create_table "submissions", force: true do |t|
    t.string   "note"
    t.datetime "submitted"
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "super_files", force: true do |t|
    t.string   "name"
    t.integer  "size"
    t.string   "url"
    t.string   "mimetype"
    t.integer  "user_id"
    t.integer  "fileable_id"
    t.string   "fileable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers_sections", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "section_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first"
    t.string   "last"
    t.string   "roles"
    t.string   "preferences"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
