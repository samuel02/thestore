class RemoveCityFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :city
  end

  def down
    add_column :orders, :city, :string
  end
end
