class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :product_id
      t.integer :customer_id
      t.decimal :rating
      t.text :comment
      t.integer :parent_id

      t.timestamps
    end
  end
end
