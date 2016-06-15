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

ActiveRecord::Schema.define(version: 20160615162928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "design_images", force: :cascade do |t|
    t.string  "file",      limit: 255
    t.integer "design_id"
  end

  create_table "designs", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description"
    t.integer  "shape_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sheet",       limit: 255
    t.integer  "priority",                default: 0
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "shape_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                  limit: 255, default: "not paid"
    t.integer  "transaction_id"
    t.datetime "paid_at"
    t.string   "customer_name"
    t.string   "customer_phone_number"
    t.string   "address_street"
    t.string   "address_additional_info"
    t.string   "address_zip"
    t.string   "address_city"
    t.string   "address_country"
    t.integer  "price"
    t.string   "payment_data"
    t.integer  "payment_id"
    t.string   "expire_month"
    t.string   "expire_year"
    t.string   "last4"
  end

  create_table "shapes", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "tutorial_url", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
