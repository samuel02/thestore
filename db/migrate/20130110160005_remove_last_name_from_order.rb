class RemoveLastNameFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :last_name
  end

  def down
    add_column :orders, :last_name, :string
  end
end
