class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :email
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
