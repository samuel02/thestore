class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "comments", "customers", :name => "comments_customer_id_fk"
    add_foreign_key "comments", "comments", :name => "comments_parent_id_fk", :column => "parent_id"
    add_foreign_key "comments", "products", :name => "comments_product_id_fk"
    add_foreign_key "line_items", "products", :name => "line_items_product_id_fk"
    add_foreign_key "orders", "customers", :name => "orders_customer_id_fk"
  end
end
