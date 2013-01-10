class RemoveAdressFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :adress
  end

  def down
    add_column :orders, :adress, :string
  end
end
