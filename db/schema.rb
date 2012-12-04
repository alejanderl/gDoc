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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121204003030) do

  create_table "audios", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.string   "description"
    t.string   "license"
    t.string   "format"
    t.integer  "duration"
    t.string   "language"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cycles", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "event_id"
  end

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.string   "description"
    t.string   "license"
    t.string   "format"
    t.string   "language"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.time     "time"
    t.string   "description"
    t.integer  "cycle_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "audio_id"
    t.integer  "document_id"
    t.integer  "video_id"
    t.integer  "photo_id"
  end

  create_table "participants", :force => true do |t|
    t.string   "name"
    t.string   "bio"
    t.boolean  "creator"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "participates", :force => true do |t|
    t.integer  "participant_id"
    t.integer  "participable_id"
    t.string   "participable_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.string   "description"
    t.string   "license"
    t.string   "format"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.string   "description"
    t.string   "license"
    t.string   "format"
    t.integer  "duration"
    t.string   "language"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
