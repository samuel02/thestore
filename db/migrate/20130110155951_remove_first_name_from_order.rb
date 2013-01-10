class RemoveFirstNameFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :first_name
  end

  def down
    add_column :orders, :first_name, :string
  end
end
