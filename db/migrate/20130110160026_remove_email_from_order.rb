class RemoveEmailFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :email
  end

  def down
    add_column :orders, :email, :string
  end
end
