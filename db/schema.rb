# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171031072029) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "postcode"
    t.integer  "prefecture_id"
    t.string   "city1"
    t.string   "city2"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "addresses", ["prefecture_id"], name: "index_addresses_on_prefecture_id"
  add_index "addresses", ["student_id"], name: "index_addresses_on_student_id"

  create_table "companies", force: :cascade do |t|
    t.string   "postcode"
    t.integer  "prefecture_id"
    t.string   "city1"
    t.string   "city2"
    t.string   "phone"
    t.string   "home_url"
    t.string   "recruit_url"
    t.integer  "business_id"
    t.integer  "listing_id"
    t.integer  "employee_number_id"
    t.integer  "activeyear"
    t.string   "business_lineup"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "companies", ["business_id"], name: "index_companies_on_business_id"
  add_index "companies", ["employee_number_id"], name: "index_companies_on_employee_number_id"
  add_index "companies", ["listing_id"], name: "index_companies_on_listing_id"
  add_index "companies", ["prefecture_id"], name: "index_companies_on_prefecture_id"

  create_table "company_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "company_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "firstname_kana"
    t.string   "lastname_kana"
    t.integer  "owner"
  end

  add_index "company_users", ["email"], name: "index_company_users_on_email", unique: true
  add_index "company_users", ["reset_password_token"], name: "index_company_users_on_reset_password_token", unique: true

  create_table "prefectures", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "area",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "lastname"
    t.string   "firstname"
    t.string   "lastname_kana"
    t.string   "firstname_kana"
    t.integer  "sex"
    t.date     "birthday"
    t.integer  "adoption_year"
    t.integer  "status"
    t.string   "form_photo"
    t.string   "birthplace"
    t.string   "phone"
    t.string   "mobilephone"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true

end
