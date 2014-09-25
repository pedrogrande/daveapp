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

ActiveRecord::Schema.define(version: 20140923104428) do

  create_table "bookings", force: true do |t|
    t.string   "date"
    t.string   "start_time"
    t.string   "end_time"
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bookings", ["space_id"], name: "index_bookings_on_space_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "schedules", force: true do |t|
    t.string   "day_of_week"
    t.string   "start_time"
    t.string   "end_time"
    t.integer  "space_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schedules", ["space_id"], name: "index_schedules_on_space_id"

  create_table "spaces", force: true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spaces", ["user_id"], name: "index_spaces_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
