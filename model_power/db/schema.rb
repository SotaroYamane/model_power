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

ActiveRecord::Schema.define(version: 20160421032741) do

  create_table "questions", force: :cascade do |t|
    t.string   "qid"
    t.string   "a"
    t.string   "b"
    t.string   "c"
    t.string   "d"
    t.string   "z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "result_alls", force: :cascade do |t|
    t.integer  "qid"
    t.boolean  "sex"
    t.integer  "a_1"
    t.integer  "a_2"
    t.integer  "a_3"
    t.integer  "a_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "rid"
    t.integer  "qid"
    t.string   "uid"
    t.integer  "ans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.boolean  "sex"
    t.integer  "age"
    t.string   "name"
    t.string   "password_digest", null: false
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
