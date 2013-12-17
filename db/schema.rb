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

ActiveRecord::Schema.define(version: 20131217100015) do

  create_table "stuff_tags", force: true do |t|
    t.integer  "stuff_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stuff_tags", ["stuff_id", "tag_id"], name: "index_stuff_tags_on_stuff_id_and_tag_id", unique: true

  create_table "stuffs", force: true do |t|
    t.string   "content"
    t.integer  "statu_code"
    t.integer  "parent_id"
    t.date     "deadline"
    t.date     "doing_date"
    t.integer  "plan_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "stuffs", ["user_id"], name: "index_stuffs_on_user_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["password"], name: "index_users_on_password"

end
