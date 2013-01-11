class AddIndicesToTables < ActiveRecord::Migration
  def change
    add_index :admins, :email, :unique => true
    add_index :customers, :email, :unique => true
    add_index :comments, :product_id
    add_index :comments, :parent_id
    add_index :comments, :customer_id
    add_index :line_items, :product_id
    add_index :line_items, :order_id
    add_index :line_items, :cart_id
    add_index :orders, :customer_id
  end
end
