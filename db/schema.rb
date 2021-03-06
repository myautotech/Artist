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

ActiveRecord::Schema.define(version: 20150510084306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.text     "details"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "achievements", ["profile_id"], name: "index_achievements_on_profile_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "pincode"
    t.string   "country"
    t.integer  "client_history_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "profile_id"
  end

  add_index "addresses", ["client_history_id"], name: "index_addresses_on_client_history_id", using: :btree
  add_index "addresses", ["profile_id"], name: "index_addresses_on_profile_id", using: :btree

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "profile_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "like",               default: 0
    t.integer  "dislike",            default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "blogs", ["profile_id"], name: "index_blogs_on_profile_id", using: :btree

  create_table "client_histories", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile_no"
    t.string   "payment_status"
    t.integer  "painting_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "client_histories", ["painting_id"], name: "index_client_histories_on_painting_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comment"
    t.integer  "like",       default: 0
    t.integer  "dislike",    default: 0
    t.integer  "blog_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "is_readed",  default: false
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_time"
    t.time     "end_time"
    t.text     "description"
    t.boolean  "publish"
    t.integer  "profile_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["profile_id"], name: "index_events_on_profile_id", using: :btree

  create_table "painting_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paintings", force: :cascade do |t|
    t.string   "title"
    t.integer  "profile_id"
    t.string   "ref_no"
    t.string   "style"
    t.text     "details"
    t.string   "medium"
    t.string   "status"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "painting_category_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "price"
    t.boolean  "price_on_request",     default: false
    t.string   "year"
    t.string   "width"
    t.string   "height"
    t.string   "packing_type"
  end

  add_index "paintings", ["painting_category_id"], name: "index_paintings_on_painting_category_id", using: :btree
  add_index "paintings", ["profile_id"], name: "index_paintings_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobile_no"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "qualifications", force: :cascade do |t|
    t.string   "qualification"
    t.string   "college_name"
    t.string   "university"
    t.string   "year"
    t.integer  "profile_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "qualifications", ["profile_id"], name: "index_qualifications_on_profile_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "achievements", "profiles"
  add_foreign_key "addresses", "client_histories"
  add_foreign_key "addresses", "profiles"
  add_foreign_key "blogs", "profiles"
  add_foreign_key "client_histories", "paintings"
  add_foreign_key "comments", "blogs"
  add_foreign_key "events", "profiles"
  add_foreign_key "paintings", "painting_categories"
  add_foreign_key "paintings", "profiles"
  add_foreign_key "qualifications", "profiles"
end
