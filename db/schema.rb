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

ActiveRecord::Schema.define(:version => 20111022141422) do

  create_table "inquiries", :force => true do |t|
    t.string   "name"
    t.string   "business_type"
    t.string   "category"
    t.string   "application_type"
    t.string   "application_budget"
    t.string   "application_contract"
    t.string   "training_format"
    t.string   "training_topic"
    t.string   "training_group_size"
    t.text     "discussion_topic"
    t.string   "phone"
    t.string   "email"
    t.string   "contact_preference"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
