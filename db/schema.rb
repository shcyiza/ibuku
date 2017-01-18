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

ActiveRecord::Schema.define(version: 20170118125237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ideas", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "expression"
    t.text     "description"
    t.boolean  "relevant"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.integer "idea_id"
    t.integer "linkable_id"
    t.string  "linked_type"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "source_id"
    t.integer  "user_id"
    t.string   "reference"
    t.string   "quote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["source_id"], name: "index_notes_on_source_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "notes_ideas", id: false, force: :cascade do |t|
    t.integer "note_id"
    t.integer "idea_id"
  end

  create_table "problematics", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.integer  "order"
    t.string   "titel"
    t.text     "abstract"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "problematics", ["user_id"], name: "index_problematics_on_user_id", using: :btree
  add_index "problematics", ["work_id"], name: "index_problematics_on_work_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "source_id"
  end

  create_table "shelves", force: :cascade do |t|
    t.integer "category_id"
    t.integer "categorizable_id"
    t.string  "categorized_type"
  end

  create_table "sources", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "author"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "source_img_file_name"
    t.string   "source_img_content_type"
    t.integer  "source_img_file_size"
    t.datetime "source_img_updated_at"
    t.date     "published_on"
    t.string   "source_type"
    t.string   "editors"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "works", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "theme"
    t.text     "abstract"
    t.boolean  "in_progress"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "works", ["user_id"], name: "index_works_on_user_id", using: :btree

end
