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

ActiveRecord::Schema.define(version: 20240524071246) do

  create_table "loan_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "loan_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "interest"
    t.string "duration"
    t.integer "penalty"
  end

  create_table "loans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "control_number"
    t.bigint "member_id"
    t.bigint "loan_type_id"
    t.decimal "loan_amount", precision: 10
    t.integer "loan_duration"
    t.string "loan_status"
    t.integer "processed_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mode_of_payment"
    t.text "purpose"
    t.text "remarks"
    t.index ["loan_type_id"], name: "index_loans_on_loan_type_id"
    t.index ["member_id"], name: "index_loans_on_member_id"
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.text "complete_address"
    t.string "contact_number"
    t.string "email_address"
    t.string "gender"
    t.string "civil_status"
    t.date "birthdate"
    t.integer "age"
    t.string "profile_picture"
    t.string "username"
    t.string "password_digest"
    t.integer "account_status", default: 0
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "payment_reference_number"
    t.bigint "member_id"
    t.date "date"
    t.decimal "payment_amount", precision: 10
    t.string "payment_status"
    t.integer "review_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "loan_id"
    t.index ["loan_id"], name: "index_payments_on_loan_id"
    t.index ["member_id"], name: "index_payments_on_member_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "loans", "loan_types"
  add_foreign_key "loans", "members"
  add_foreign_key "payments", "loans"
  add_foreign_key "payments", "members"
end
