class Order < ActiveRecord::Base
  attr_accessible :adress, :city, :email, :first_name, :last_name, :postal_code
end
