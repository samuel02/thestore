class LineItem < ActiveRecord::Base
  attr_accessible :amount, :cart_id, :order_id, :product_id

  validates_presence_of :cart_id,
                        :amount,
                        :product_id

  belongs_to :cart
  belongs_to :product

  def price
    product.price * amount
  end
end