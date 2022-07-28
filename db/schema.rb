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

ActiveRecord::Schema.define(version: 2022_07_25_193437) do

  create_table "cars", force: :cascade do |t|
    t.text "registration_number"
    t.text "color"
    t.text "brand"
    t.text "model"
    t.text "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_lots", force: :cascade do |t|
    t.text "name"
    t.bigint "capacity"
    t.float "hourly_charge"
    t.string "status"
    t.text "address"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_parking_lots_on_email", unique: true
    t.index ["reset_password_token"], name: "index_parking_lots_on_reset_password_token", unique: true
  end

  create_table "parking_spots", force: :cascade do |t|
    t.bigint "number"
    t.boolean "vacant"
    t.integer "parking_lot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parking_lot_id"], name: "index_parking_spots_on_parking_lot_id"
  end

  create_table "parking_tickets", force: :cascade do |t|
    t.text "ticket_number"
    t.integer "car_id"
    t.integer "parking_spot_id"
    t.integer "parking_lot_id"
    t.datetime "in_time"
    t.datetime "out_time"
    t.float "total_charges"
    t.text "payment_mode"
    t.text "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "exit_car"
    t.index ["car_id"], name: "index_parking_tickets_on_car_id"
    t.index ["parking_lot_id"], name: "index_parking_tickets_on_parking_lot_id"
    t.index ["parking_spot_id"], name: "index_parking_tickets_on_parking_spot_id"
  end

end
