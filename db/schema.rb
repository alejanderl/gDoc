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

ActiveRecord::Schema.define(:version => 20130109005732) do

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

  create_table "audios_events", :id => false, :force => true do |t|
    t.integer "audio_id"
    t.integer "event_id"
  end

  create_table "cycles", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cycles_events", :id => false, :force => true do |t|
    t.integer "cycle_id"
    t.integer "event_id"
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

  create_table "documents_events", :id => false, :force => true do |t|
    t.integer "document_id"
    t.integer "event_id"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.time     "time"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events_photos", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "photo_id"
  end

  create_table "events_videos", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "video_id"
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
    t.string   "image"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

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
