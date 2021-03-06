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

ActiveRecord::Schema.define(:version => 20121212190934) do

  create_table "actions", :force => true do |t|
    t.string   "name"
    t.string   "alias",       :null => false
    t.string   "meta_k"
    t.string   "meta_d"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "advantages", :force => true do |t|
    t.string   "name"
    t.string   "announce"
    t.string   "avatar"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "deleted"
  end

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.string   "meta_d"
    t.string   "meta_k"
    t.boolean  "active",      :default => true
    t.boolean  "trash",       :default => false
    t.text     "description"
    t.string   "alias",                          :null => false
    t.string   "avatar",                         :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "discounts", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.boolean  "active"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "name"
    t.string   "alias",                         :null => false
    t.date     "date"
    t.text     "announce",                      :null => false
    t.text     "text"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "active",     :default => true,  :null => false
    t.boolean  "trash",      :default => false, :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "address"
    t.boolean  "up"
    t.boolean  "delivery"
    t.string   "phone",      :limit => 20, :default => ""
    t.string   "fio"
    t.string   "email"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.boolean  "ready",                    :default => false, :null => false
  end

  create_table "product_brands", :force => true do |t|
    t.integer  "product_id"
    t.integer  "brand_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_images", :force => true do |t|
    t.string   "name",                          :null => false
    t.integer  "product_id",                    :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "main",       :default => false, :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "article",                                                       :null => false
    t.string   "name"
    t.integer  "brand_id",                                                      :null => false
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
    t.integer  "discount_id"
  end

  create_table "products_actions", :force => true do |t|
    t.integer  "product_id"
    t.integer  "action_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products_categories", :force => true do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.boolean  "main_category", :default => false, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "products_surfaces", :id => false, :force => true do |t|
    t.integer "product_id", :null => false
    t.integer "surface_id", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "surfaces", :force => true do |t|
    t.string   "name"
    t.string   "avatar"
    t.boolean  "active",     :default => true,  :null => false
    t.boolean  "trash",      :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "fio"
    t.string   "email"
    t.string   "phone",      :limit => 20, :default => "", :null => false
    t.string   "password",   :limit => 50,                 :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

end
