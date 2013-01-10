class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :email, :first_name, :last_name, :password_hash, :password_salt, :postal_code
end
