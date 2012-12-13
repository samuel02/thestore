class Order < ActiveRecord::Base
  attr_accessible :adress, :city, :email, :first_name, :last_name, :postal_code
  has_many :line_items

  validates_presence_of :adress,
                        :city,
                        :email,
                        :first_name,
                        :last_name,
                        :postal_code

  def add_items(cart)
    cart.line_items.each do |item|
      line_items << item
    end
  end

end
