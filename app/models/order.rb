class AvailabilityValidator < ActiveModel::Validator
  def validate(record)
    unless product_available?(record)
      record.errors.add :base, "We currently don't have enough of #{item.product.name} in stock."
    end
  end

  def product_available?(record)
    record.line_items.any? { |item| item.product.available?(item.amount) }
  end
end

class Order < ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessible :customer_id
  has_many :line_items, :dependent => :destroy
  belongs_to :customer

  validates_presence_of :customer_id
  validates_with AvailabilityValidator

  def add_items(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price
    line_items.sum(&:price)
  end

end
