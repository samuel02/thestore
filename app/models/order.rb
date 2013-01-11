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

  attr_accessible :customer_id
  has_many :line_items, :dependent => :destroy
  belongs_to :customer
  after_commit :update_product_quantity, :on => :create

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

  private

  def update_product_quantity
    line_items.each do |item|
      product = Product.find(item.product)
      product.decrement!(:quantity, item.amount)
    end
  end

end
