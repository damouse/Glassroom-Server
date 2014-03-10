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

ActiveRecord::Schema.define(version: 20140310043304) do

  create_table "audios", force: true do |t|
    t.date     "created_on"
    t.integer  "lecture_id"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "audios", ["lecture_id"], name: "index_audios_on_lecture_id"

  create_table "lectures", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.date     "created_on"
    t.date     "last_updated"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lectures", ["subject_id"], name: "index_lectures_on_subject_id"

  create_table "notes", force: true do |t|
    t.date     "created_on"
    t.integer  "lecture_id"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["lecture_id"], name: "index_notes_on_lecture_id"

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.date     "created_on"
    t.integer  "lecture_id"
    t.string   "uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["lecture_id"], name: "index_videos_on_lecture_id"

end
