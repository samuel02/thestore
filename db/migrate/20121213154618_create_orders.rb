class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :adress
      t.string :postal_code
      t.string :city

      t.timestamps
    end
  end
end
