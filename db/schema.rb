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

ActiveRecord::Schema.define(version: 2021_01_05_074122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "builders", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "firebase_token"
    t.string "status"
    t.text "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.string "role", limit: 30
    t.string "phone_number", limit: 30
    t.boolean "approved", default: false
    t.index ["authentication_token"], name: "index_builders_on_authentication_token", unique: true
  end

  create_table "job_applications", force: :cascade do |t|
    t.bigint "job_id"
    t.bigint "service_id"
    t.string "status"
    t.text "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_job_applications_on_job_id"
    t.index ["service_id"], name: "index_job_applications_on_service_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "project_id"
    t.string "title"
    t.text "description"
    t.string "need_person"
    t.string "status"
    t.text "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_jobs_on_project_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "service_id"
    t.string "status"
    t.text "reason"
    t.string "aadhar_back_url"
    t.string "aadhar_front_url"
    t.string "aadhar_no"
    t.string "builder_state"
    t.string "city"
    t.string "country"
    t.string "email_id"
    t.string "mobile_no"
    t.string "occupation"
    t.string "other_user_name"
    t.string "permanent_address"
    t.string "pincode"
    t.string "profile_pic"
    t.string "user_type"
    t.string "skill_service_provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "builder_id"
    t.index ["service_id"], name: "index_profiles_on_service_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "builder_id"
    t.string "status"
    t.text "reason"
    t.string "accommd"
    t.string "contact_person_mob"
    t.string "builder_name"
    t.string "city"
    t.string "contact_person"
    t.string "country"
    t.string "image_url_1"
    t.string "image_url_2"
    t.string "image_url_3"
    t.string "image_url_4"
    t.string "pincode"
    t.string "project_address"
    t.string "project_duration"
    t.string "project_name"
    t.string "project_type"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "approved", default: false
    t.index ["builder_id"], name: "index_projects_on_builder_id"
  end

  create_table "service_type_mappings", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "service_type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_service_type_mappings_on_service_id"
    t.index ["service_type_id"], name: "index_service_type_mappings_on_service_type_id"
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.text "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "architect"
    t.boolean "carpenter"
    t.boolean "electric_fitter"
    t.boolean "fabricator"
    t.boolean "interior_designer"
    t.boolean "labour"
    t.boolean "marble_finisher"
    t.boolean "pop_designer"
    t.boolean "painter"
    t.boolean "plot"
    t.boolean "plumber"
    t.boolean "rajmishtri"
    t.boolean "tile_fitter"
    t.string "firebase_token"
    t.string "status"
    t.text "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.string "role", limit: 30
    t.string "phone_number", limit: 30
    t.boolean "approved", default: false
    t.index ["authentication_token"], name: "index_services_on_authentication_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "firebase_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.string "role", limit: 30
    t.string "phone_number", limit: 30
    t.boolean "approved", default: false
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  end

end
