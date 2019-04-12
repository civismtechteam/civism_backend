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

ActiveRecord::Schema.define(version: 20190308201722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "body", null: false
    t.integer "num_upvotes", default: 0, null: false
    t.integer "num_downvotes", default: 0, null: false
    t.integer "num_comments", default: 0, null: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "facts", force: :cascade do |t|
    t.string "body", null: false
    t.string "source_link", null: false
    t.integer "num_upvotes", default: 0, null: false
    t.integer "num_downvotes", default: 0, null: false
    t.integer "num_comments", default: 0, null: false
    t.bigint "scoop_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scoop_id"], name: "index_facts_on_scoop_id"
    t.index ["user_id"], name: "index_facts_on_user_id"
  end

  create_table "perspectives", force: :cascade do |t|
    t.string "body", null: false
    t.integer "num_upvotes", default: 0, null: false
    t.integer "num_downvotes", default: 0, null: false
    t.integer "num_comments", default: 0, null: false
    t.bigint "scoop_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scoop_id"], name: "index_perspectives_on_scoop_id"
    t.index ["user_id"], name: "index_perspectives_on_user_id"
  end

  create_table "scoops", force: :cascade do |t|
    t.string "name", null: false
    t.string "image_path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "image_path", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "direction", null: false
    t.bigint "user_id"
    t.string "voteable_type"
    t.bigint "voteable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "voteable_id", "voteable_type"], name: "index_votes_on_user_id_and_voteable_id_and_voteable_type", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "facts", "scoops"
  add_foreign_key "facts", "users"
  add_foreign_key "perspectives", "scoops"
  add_foreign_key "perspectives", "users"
  add_foreign_key "votes", "users"
end
