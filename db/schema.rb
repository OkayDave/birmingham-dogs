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

ActiveRecord::Schema.define(version: 20150801065746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breeds", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.integer  "shelter_id",                   null: false
    t.string   "name",                         null: false
    t.boolean  "is_female",     default: true
    t.text     "description"
    t.integer  "breed_id",                     null: false
    t.date     "date_of_birth"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "image_url"
  end

  add_index "dogs", ["breed_id"], name: "index_dogs_on_breed_id", using: :btree
  add_index "dogs", ["is_female"], name: "index_dogs_on_is_female", using: :btree
  add_index "dogs", ["shelter_id"], name: "index_dogs_on_shelter_id", using: :btree

  create_table "shelters", force: :cascade do |t|
    t.string   "name",            null: false
    t.text     "description",     null: false
    t.text     "contact_details"
    t.string   "url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
