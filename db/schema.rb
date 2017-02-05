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

ActiveRecord::Schema.define(version: 20170117064442) do

  create_table "clones", force: :cascade do |t|
    t.string  "name"
    t.string  "comment"
    t.integer "vine_id"
  end

  create_table "customer_orders", force: :cascade do |t|
    t.string  "business_name"
    t.string  "address"
    t.string  "contact_person"
    t.string  "phone_number"
    t.string  "mobile_number"
    t.string  "email_address"
    t.string  "month"
    t.integer "year"
  end

  create_table "rootstocks", force: :cascade do |t|
    t.string "name"
    t.string "comment"
  end

  create_table "vine_orders", force: :cascade do |t|
    t.string  "variety"
    t.string  "clone"
    t.string  "rootstock"
    t.integer "quantity"
    t.boolean "potted"
    t.boolean "trimmed"
    t.integer "customer_order_id"
  end

  create_table "vines", force: :cascade do |t|
    t.string "name"
    t.string "colour"
    t.string "comment"
  end

end
