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

ActiveRecord::Schema.define(version: 2019_06_06_065958) do

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_tickets", force: :cascade do |t|
    t.decimal "price"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_transactions", force: :cascade do |t|
    t.integer "order_id"
    t.string "action"
    t.integer "amount"
    t.boolean "success"
    t.string "authorization"
    t.string "message"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "ip_address"
    t.string "first_name"
    t.string "last_name"
    t.string "card_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
    t.string "express_token"
    t.string "express_payer_id"
    t.integer "plan_id"
    t.integer "book_id"
    t.boolean "recuring", default: false
    t.date "card_expires_on"
  end

  create_table "plans", force: :cascade do |t|
    t.integer "amount"
    t.string "frequency"
    t.integer "cycles"
    t.string "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
