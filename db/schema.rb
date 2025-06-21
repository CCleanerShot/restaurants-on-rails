# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 10) do
  create_table "restaurant_tags", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.integer "tag_id", null: false
    t.integer "upvotes", default: 0
    t.integer "downvotes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["downvotes"], name: "index_restaurant_tags_on_downvotes"
    t.index ["restaurant_id", "tag_id"], name: "index_restaurant_tags_on_restaurant_id_and_tag_id", unique: true
    t.index ["restaurant_id"], name: "index_restaurant_tags_on_restaurant_id"
    t.index ["tag_id"], name: "index_restaurant_tags_on_tag_id"
    t.index ["upvotes"], name: "index_restaurant_tags_on_upvotes"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.text "address"
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.string "phone"
    t.string "website"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_restaurant_id"
    t.index ["latitude", "longitude"], name: "index_restaurants_on_latitude_and_longitude"
    t.index ["name"], name: "index_restaurants_on_name"
  end

  create_table "review_votes", force: :cascade do |t|
    t.integer "review_id", null: false
    t.integer "user_id", null: false
    t.string "vote_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id", "user_id"], name: "index_review_votes_on_review_id_and_user_id", unique: true
    t.index ["review_id"], name: "index_review_votes_on_review_id"
    t.index ["user_id"], name: "index_review_votes_on_user_id"
    t.index ["vote_type"], name: "index_review_votes_on_vote_type"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.integer "user_id", null: false
    t.integer "rating", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.integer "helpful_votes", default: 0
    t.integer "unhelpful_votes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_reviews_on_created_at"
    t.index ["rating"], name: "index_reviews_on_rating"
    t.index ["restaurant_id", "user_id"], name: "index_reviews_on_restaurant_id_and_user_id", unique: true
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tag_votes", force: :cascade do |t|
    t.integer "restaurant_tag_id", null: false
    t.integer "user_id", null: false
    t.string "vote_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_tag_id", "user_id"], name: "index_tag_votes_on_restaurant_tag_id_and_user_id", unique: true
    t.index ["restaurant_tag_id"], name: "index_tag_votes_on_restaurant_tag_id"
    t.index ["user_id"], name: "index_tag_votes_on_user_id"
    t.index ["vote_type"], name: "index_tag_votes_on_vote_type"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "restaurant_tags", "restaurants"
  add_foreign_key "restaurant_tags", "tags"
  add_foreign_key "review_votes", "reviews"
  add_foreign_key "review_votes", "users"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
  add_foreign_key "tag_votes", "restaurant_tags"
  add_foreign_key "tag_votes", "users"
end
