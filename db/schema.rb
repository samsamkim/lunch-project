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

ActiveRecord::Schema.define(version: 2020_07_31_144046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "description"
    t.integer "weight"
    t.integer "portion"
    t.integer "final_price"
    t.integer "weight_ratio"
    t.integer "portion_ratio"
    t.float "price_ratio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_courses_on_category_id"
  end

  create_table "courses_daily_menus", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "daily_menu_id", null: false
    t.index ["course_id", "daily_menu_id"], name: "index_courses_daily_menus_on_course_id_and_daily_menu_id"
    t.index ["daily_menu_id", "course_id"], name: "index_courses_daily_menus_on_daily_menu_id_and_course_id"
  end

  create_table "daily_menus", force: :cascade do |t|
    t.date "date"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "unit"
    t.string "name"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_measurements_on_course_id"
  end

  create_table "pricings", force: :cascade do |t|
    t.decimal "final_price", precision: 12, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "daily_menu_id"
    t.bigint "course_id"
    t.index ["course_id"], name: "index_pricings_on_course_id"
    t.index ["daily_menu_id"], name: "index_pricings_on_daily_menu_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "categories"
  add_foreign_key "measurements", "courses"
  add_foreign_key "pricings", "courses"
  add_foreign_key "pricings", "daily_menus"
end
