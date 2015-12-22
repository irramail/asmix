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

ActiveRecord::Schema.define(version: 20151221150001) do

  create_table "contents", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.integer  "market_id"
    t.string   "name"
    t.integer  "ping"
    t.integer  "tzdate"
    t.string   "sn"
    t.text     "comment"
    t.boolean  "active"
    t.integer  "eq0"
    t.integer  "eq1"
    t.integer  "eq2"
    t.integer  "eq3"
    t.integer  "eq4"
    t.integer  "eq5"
    t.integer  "eq6"
    t.integer  "eq7"
    t.integer  "eq8"
    t.integer  "eq9"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "devices", ["market_id"], name: "index_devices_on_market_id"

  create_table "markets", force: :cascade do |t|
    t.string   "name"
    t.integer  "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mediafiles", force: :cascade do |t|
    t.string   "file"
    t.string   "md5"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mediafiles", ["content_id"], name: "index_mediafiles_on_content_id"

  create_table "volsofdays", force: :cascade do |t|
    t.string   "time"
    t.integer  "value"
    t.integer  "market_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "volsofdays", ["market_id"], name: "index_volsofdays_on_market_id"

  create_table "volumes", force: :cascade do |t|
    t.integer  "device_id"
    t.string   "description"
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "volumes", ["device_id"], name: "index_volumes_on_device_id"

  create_table "worktime_broadcastings", force: :cascade do |t|
    t.integer  "market_id"
    t.integer  "wday"
    t.string   "start"
    t.string   "stop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "worktime_broadcastings", ["market_id"], name: "index_worktime_broadcastings_on_market_id"

end
