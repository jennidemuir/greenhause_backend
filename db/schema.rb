# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_16_170533) do

  create_table "canvas", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "canvas"
    t.string "canvas_notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_canvas_on_user_id"
  end

  create_table "plantcards", force: :cascade do |t|
    t.string "commonname"
    t.string "scientificname"
    t.string "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plantcollections", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plantcard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plantcard_id"], name: "index_plantcollections_on_plantcard_id"
    t.index ["user_id"], name: "index_plantcollections_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "canvas", "users"
  add_foreign_key "plantcollections", "plantcards"
  add_foreign_key "plantcollections", "users"
end
