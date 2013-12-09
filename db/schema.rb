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

ActiveRecord::Schema.define(version: 20131208222608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "tags", force: true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "tags_topics", force: true do |t|
    t.integer "tag_id"
    t.integer "topic_id"
  end

  add_index "tags_topics", ["tag_id", "topic_id"], name: "idx_tags_topics", using: :btree

  create_table "topics", force: true do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "topics_tags", force: true do |t|
    t.integer "topic_id"
    t.integer "tag_id"
  end

  add_index "topics_tags", ["topic_id", "tag_id"], name: "idx_topics_tags", using: :btree

end
