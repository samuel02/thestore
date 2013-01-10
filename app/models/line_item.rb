class LineItem < ActiveRecord::Base
  attr_accessible :amount, :cart_id, :order_id, :product_id

  validates_presence_of :amount,
                        :product_id

  belongs_to :cart
  belongs_to :product
  belongs_to :order

  def price
    product.price * amount
  end
end