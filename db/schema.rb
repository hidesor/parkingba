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

ActiveRecord::Schema.define(version: 20160822150848) do

  create_table "parks", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "park_id"
    t.string   "_id"
    t.string   "parkid"
    t.string   "areaid"
    t.string   "areaname"
    t.string   "parkname"
    t.string   "introduction"
    t.string   "address"
    t.string   "totalspace"
    t.string   "surplusspace"
    t.string   "payguide"
    t.string   "updatetime"
    t.string   "wgsx"
    t.string   "wgsy"
  end

end
