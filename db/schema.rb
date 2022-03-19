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

ActiveRecord::Schema.define(version: 6) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "procedure"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes_ingredients", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "recipes", "users"
  add_foreign_key "recipes_ingredients", "ingredients"
  add_foreign_key "recipes_ingredients", "recipes"
end
