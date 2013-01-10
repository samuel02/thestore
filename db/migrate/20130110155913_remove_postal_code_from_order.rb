class RemovePostalCodeFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :postal_code
  end

  def down
    add_column :orders, :postal_code, :string
  end
end
