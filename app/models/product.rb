class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :quantity

  validates_presence_of :name, :description, :price, :quantity

  has_many :line_items

end
