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

ActiveRecord::Schema.define(version: 20170425183934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "calculations", force: :cascade do |t|
    t.integer  "base_currency_id"
    t.integer  "target_currency_id"
    t.integer  "amount"
    t.integer  "max_waiting_time"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.index ["base_currency_id"], name: "index_calculations_on_base_currency_id", using: :btree
    t.index ["target_currency_id"], name: "index_calculations_on_target_currency_id", using: :btree
    t.index ["user_id"], name: "index_calculations_on_user_id", using: :btree
  end

  create_table "currencies", force: :cascade do |t|
    t.string "code", limit: 3
  end

  create_table "currency_rates", force: :cascade do |t|
    t.integer  "base_currency_id"
    t.integer  "year"
    t.integer  "week"
    t.hstore   "rates"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["base_currency_id", "year", "week"], name: "index_currency_rates_on_base_currency_id_and_year_and_week", unique: true, using: :btree
    t.index ["base_currency_id"], name: "index_currency_rates_on_base_currency_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "calculations", "currencies", column: "base_currency_id"
  add_foreign_key "calculations", "currencies", column: "target_currency_id"
  add_foreign_key "calculations", "users"
  add_foreign_key "currency_rates", "currencies", column: "base_currency_id"
end
