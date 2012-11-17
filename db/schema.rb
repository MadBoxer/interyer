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

ActiveRecord::Schema.define(:version => 9) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.string   "meta_d"
    t.string   "meta_k"
    t.boolean  "active",      :default => true
    t.boolean  "trash",       :default => false
    t.text     "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "order_id",   :default => 0, :null => false
    t.integer  "quantity"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "carts", :force => true do |t|
    t.string   "session_id", :limit => 32, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "single_name",                    :null => false
    t.string   "alias",       :default => "",    :null => false
    t.integer  "parent_id",   :default => 0,     :null => false
    t.string   "meta_d"
    t.string   "meta_k"
    t.boolean  "active",      :default => true,  :null => false
    t.boolean  "trash",       :default => false, :null => false
    t.text     "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "sort",                           :null => false
    t.string   "image",                          :null => false
  end

  create_table "product_brands", :force => true do |t|
    t.integer  "product_id"
    t.integer  "brand_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_images", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "product_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "alias",                                                         :null => false
    t.string   "meta_d",                                                        :null => false
    t.string   "meta_k",                                                        :null => false
    t.decimal  "price",       :precision => 10, :scale => 2
    t.string   "garranty"
    t.string   "duration"
    t.string   "delivery"
    t.string   "notice"
    t.text     "description"
    t.boolean  "active",                                     :default => true,  :null => false
    t.boolean  "trash",                                      :default => false, :null => false
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.boolean  "main_page",                                  :default => false, :null => false
    t.string   "avatar",                                                        :null => false
  end

  create_table "products_categories", :force => true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.boolean  "main_category", :default => false, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
