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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 5) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.string   "meta_d"
    t.string   "meta_k"
    t.boolean  "active"
    t.boolean  "trash"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id",   :default => 0, :null => false
    t.string   "meta_d"
    t.string   "meta_k"
    t.text     "description"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "product_brands", :force => true do |t|
    t.integer  "product_id"
    t.integer  "brand_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_categories", :force => true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "meta_d",                                    :null => false
    t.string   "meta_k",                                    :null => false
    t.decimal  "price",      :precision => 10, :scale => 2
    t.string   "garranty"
    t.string   "duration"
    t.string   "delivery"
    t.string   "notice"
    t.text     "descripton"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

end