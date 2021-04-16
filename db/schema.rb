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

ActiveRecord::Schema.define(version: 2021_04_16_193025) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "animal_groups", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", limit: 140, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_animal_groups_on_user_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "scientific_name"
    t.string "common_name"
    t.string "name", limit: 140, null: false
    t.string "sex", limit: 1, default: "u", null: false
    t.string "age"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "animal_group_id", null: false
    t.date "date_acquired"
    t.integer "supplier_id"
    t.index ["animal_group_id"], name: "index_animals_on_animal_group_id"
    t.index ["supplier_id"], name: "index_animals_on_supplier_id"
  end

  create_table "cleaning_records", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.date "recorded_on", null: false
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_cleaning_records_on_animal_id"
  end

  create_table "feeder_groups", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", limit: 140, null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_feeder_groups_on_user_id"
  end

  create_table "feeders", force: :cascade do |t|
    t.integer "feeder_group_id", null: false
    t.string "name", limit: 140, null: false
    t.integer "count", default: 0, null: false
    t.decimal "weight", precision: 10, scale: 3
    t.decimal "cost", precision: 10, scale: 2
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feeder_group_id"], name: "index_feeders_on_feeder_group_id"
  end

  create_table "feeding_records", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.text "notes"
    t.date "recorded_on", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "feeder_id"
    t.index ["animal_id"], name: "index_feeding_records_on_animal_id"
    t.index ["feeder_id"], name: "index_feeding_records_on_feeder_id"
  end

  create_table "schedule_items", force: :cascade do |t|
    t.integer "schedule_id", null: false
    t.string "name", limit: 140, null: false
    t.text "description"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_schedule_items_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", limit: 140, null: false
    t.text "description"
    t.string "repeat", limit: 10, null: false
    t.date "start_on", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "stock_list_placements", force: :cascade do |t|
    t.integer "stock_list_id", null: false
    t.integer "animal_id", null: false
    t.decimal "price", precision: 10, scale: 2
    t.string "name", limit: 140, null: false
    t.text "description"
    t.date "available_from"
    t.boolean "visible", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_stock_list_placements_on_animal_id"
    t.index ["stock_list_id"], name: "index_stock_list_placements_on_stock_list_id"
  end

  create_table "stock_lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", limit: 140, null: false
    t.date "available_from"
    t.text "description"
    t.boolean "visible", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stock_lists_on_user_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name", limit: 140, null: false
    t.string "email", limit: 254
    t.string "phone_number"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "address_line_3"
    t.text "description"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "company"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_suppliers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 80, null: false
    t.string "last_name", limit: 80, null: false
    t.string "email", limit: 254, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weight_records", force: :cascade do |t|
    t.decimal "weight", precision: 10, scale: 3, null: false
    t.date "recorded_on", null: false
    t.integer "animal_id", null: false
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unit", limit: 2, null: false
    t.index ["animal_id"], name: "index_weight_records_on_animal_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "animal_groups", "users", on_delete: :cascade
  add_foreign_key "animals", "animal_groups", on_delete: :cascade
  add_foreign_key "stock_list_placements", "stock_lists", on_delete: :cascade
  add_foreign_key "stock_lists", "users", on_delete: :cascade
end
