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

ActiveRecord::Schema.define(version: 2018_12_04_131936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.bigint "user_id"
    t.string "registration_number"
    t.integer "estimated_kilometers"
    t.text "why_selling"
    t.integer "exact_kilometer"
    t.string "location"
    t.string "car_brand"
    t.date "year_of_production"
    t.text "car_registration_document"
    t.date "first_registration_date"
    t.string "fuel_type"
    t.string "gearbox"
    t.string "model_type"
    t.string "model_version"
    t.string "model_variant"
    t.text "announce_description"
    t.integer "maximum_net_power"
    t.string "commercial_name"
    t.integer "CNIT_code"
    t.integer "VIN_code"
    t.string "cylinder"
    t.integer "fiscal_horsepower"
    t.integer "seating_place_number"
    t.integer "door_number"
    t.integer "CO2_emission"
    t.string "environmental_class"
    t.date "next_technical_control_date"
    t.integer "given_price"
    t.integer "estimated_price"
    t.text "maintenance_record"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_1"
    t.string "photo_2"
    t.string "photo_3"
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "damages", force: :cascade do |t|
    t.bigint "car_id"
    t.string "title"
    t.text "description"
    t.string "picture_1"
    t.string "picture_2"
    t.string "picture_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_damages_on_car_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.date "birth_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cars", "users"
  add_foreign_key "damages", "cars"
end
