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

ActiveRecord::Schema.define(version: 20150830074131) do

<<<<<<< HEAD
  create_table "messages", force: true do |t|
=======
<<<<<<< HEAD
  create_table "messages", force: :cascade do |t|
=======
  create_table "messages", force: true do |t|
>>>>>>> e89905e35be3ac55d530aa03fdfc730ae044b89e
>>>>>>> 8481cb1a9cd71a4da2e589a4e2ea44dd44b348bf
    t.string   "messe"
    t.integer  "snsstudy_id"
    t.integer  "to_snsstudy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["snsstudy_id", "created_at"], name: "index_messages_on_snsstudy_id_and_created_at"

<<<<<<< HEAD
  create_table "relationships", force: true do |t|
=======
<<<<<<< HEAD
  create_table "relationships", force: :cascade do |t|
=======
  create_table "relationships", force: true do |t|
>>>>>>> e89905e35be3ac55d530aa03fdfc730ae044b89e
>>>>>>> 8481cb1a9cd71a4da2e589a4e2ea44dd44b348bf
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true

<<<<<<< HEAD
  create_table "snsstudies", force: true do |t|
=======
<<<<<<< HEAD
  create_table "snsstudies", force: :cascade do |t|
=======
  create_table "snsstudies", force: true do |t|
>>>>>>> e89905e35be3ac55d530aa03fdfc730ae044b89e
>>>>>>> 8481cb1a9cd71a4da2e589a4e2ea44dd44b348bf
    t.string   "name"
    t.text     "introduction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "email"
    t.string   "remember_token"
  end

  add_index "snsstudies", ["remember_token"], name: "index_snsstudies_on_remember_token"

<<<<<<< HEAD
  create_table "tsubyakis", force: true do |t|
=======
<<<<<<< HEAD
  create_table "tsubyakis", force: :cascade do |t|
=======
  create_table "tsubyakis", force: true do |t|
>>>>>>> e89905e35be3ac55d530aa03fdfc730ae044b89e
>>>>>>> 8481cb1a9cd71a4da2e589a4e2ea44dd44b348bf
    t.string   "content"
    t.integer  "snsstudy_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
