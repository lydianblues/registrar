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

ActiveRecord::Schema.define(version: 20160505015155) do

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "facilitators", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "occupation"
    t.string   "organization"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "code"
    t.decimal  "early_cost",                precision: 8, scale: 2
    t.decimal  "late_cost",                 precision: 8, scale: 2
    t.decimal  "staff_cost",                precision: 8, scale: 2
    t.date     "new_registration_closed"
    t.date     "early_registration_cutoff"
    t.integer  "course_id"
    t.integer  "facilitator_id"
    t.integer  "location_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["course_id"], name: "index_trainings_on_course_id"
    t.index ["facilitator_id"], name: "index_trainings_on_facilitator_id"
    t.index ["location_id"], name: "index_trainings_on_location_id"
  end

end
