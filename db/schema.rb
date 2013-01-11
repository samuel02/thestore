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

ActiveRecord::Schema.define(:version => 20130111204038) do

  create_table "admins", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "product_id"
    t.integer  "customer_id"
    t.decimal  "rating",      :precision => 10, :scale => 0
    t.integer  "parent_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.text     "content"
    t.integer  "level"
  end

  add_index "comments", ["customer_id"], :name => "index_comments_on_customer_id"
  add_index "comments", ["parent_id"], :name => "index_comments_on_parent_id"
  add_index "comments", ["product_id"], :name => "index_comments_on_product_id"

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "customers", ["email"], :name => "index_customers_on_email", :unique => true

  create_table "line_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "cart_id"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "line_items", ["cart_id"], :name => "index_line_items_on_cart_id"
  add_index "line_items", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "line_items", ["product_id"], :name => "index_line_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "customer_id"
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.integer  "quantity",                                  :default => 0
    t.string   "image_url"
  end

  add_foreign_key "comments", "comments", :name => "comments_parent_id_fk", :column => "parent_id"
  add_foreign_key "comments", "customers", :name => "comments_customer_id_fk"
  add_foreign_key "comments", "products", :name => "comments_product_id_fk"

  add_foreign_key "line_items", "products", :name => "line_items_product_id_fk"

  add_foreign_key "orders", "customers", :name => "orders_customer_id_fk"

end
