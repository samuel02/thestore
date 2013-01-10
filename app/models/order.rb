class AvailabilityValidator < ActiveModel::Validator
  def validate(record)
    record.line_items.each do |item|
      unless item.product.available?(item.amount)
        record.errors[:base] << "We currently don't have enough of #{item.product.name} in stock."
      end
    end
  end
end

class Order < ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessible :adress, :city, :email, :first_name, :last_name, :postal_code
  has_many :line_items

  validates_presence_of :adress,
                        :city,
                        :email,
                        :first_name,
                        :last_name,
                        :postal_code

  validates_with AvailabilityValidator

  def add_items(cart)
    cart.line_items.each do |item|
      line_items << item
      item.cart_id = nil
    end
  end

  def total_price
    line_items.sum(&:price)
  end
end
