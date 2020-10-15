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

ActiveRecord::Schema.define(version: 2020_10_15_211354) do

  create_table "circuits", force: :cascade do |t|
    t.string "name"
    t.string "locality"
    t.string "country"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "circuitid"
  end

  create_table "circuits_seasons", id: false, force: :cascade do |t|
    t.integer "circuit_id", null: false
    t.integer "season_id", null: false
    t.index ["circuit_id", "season_id"], name: "index_circuits_seasons_on_circuit_id_and_season_id"
    t.index ["season_id", "circuit_id"], name: "index_circuits_seasons_on_season_id_and_circuit_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "driverid"
    t.string "nationality"
  end

  create_table "laptimes", force: :cascade do |t|
    t.time "laptime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "driver_id", null: false
    t.integer "circuit_id", null: false
    t.integer "season_id", null: false
    t.index ["circuit_id"], name: "index_laptimes_on_circuit_id"
    t.index ["driver_id"], name: "index_laptimes_on_driver_id"
    t.index ["season_id"], name: "index_laptimes_on_season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "laptimes", "circuits"
  add_foreign_key "laptimes", "drivers"
  add_foreign_key "laptimes", "seasons"
end
