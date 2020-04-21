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

ActiveRecord::Schema.define(version: 20200421135646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name"
    t.string "record_gid"
    t.integer "blob_id"
    t.time "created_at"
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_gid", "blob_id"], name: "index_active_storage_attachments_on_record_gid_and_blob_id", unique: true
    t.index ["record_gid", "name"], name: "index_active_storage_attachments_on_record_gid_and_name"
    t.index ["record_gid"], name: "index_active_storage_attachments_on_record_gid"
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key"
    t.string "filename"
    t.string "content_type"
    t.text "metadata"
    t.integer "byte_size"
    t.string "checksum"
    t.time "created_at"
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "addressable_id"
    t.string "addressable_type"
    t.string "country"
    t.string "city"
    t.string "area"
    t.text "street"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id_type"
    t.bigint "user_id_id"
    t.index ["user_id_type", "user_id_id"], name: "index_addresses_on_user_id_type_and_user_id_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.integer "age"
    t.string "gender"
    t.bigint "phone_number"
    t.datetime "start", null: false
    t.datetime "finish", null: false
  end

  create_table "availables", force: :cascade do |t|
    t.integer "doctor_id"
    t.datetime "Start", null: false
    t.datetime "Finish", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "department_head_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_head_id"], name: "index_departments_on_department_head_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "rank"
    t.string "position"
    t.bigint "hourly_rate"
    t.string "email"
    t.bigint "phone_number"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stripe_customer_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.string "email"
    t.bigint "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stripe_customer_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.text "body"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer "doctor_id"
    t.string "name"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "patients"
  add_foreign_key "skills", "doctors"
  add_foreign_key "availables", "doctors"
  add_foreign_key "doctors", "departments"
end
