class Admin < ActiveRecord::Base
  attr_accessible :email, :password_hash, :password_salt
end
