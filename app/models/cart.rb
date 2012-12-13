class Cart < ActiveRecord::Base
  has_many :line_items


  def add_product(product)
    current_line_item = line_items.find_by_product_id(product)

    if current_line_item
      Rails.logger.debug "This product is already in cart."
      current_line_item.amount += 1
      line_item = current_line_item
    else
      Rails.logger.debug "Let's build a new product."
      line_item = line_items.build(:product_id => product.id, :amount => 1)
    end

    line_item
  end

  def total_price
    total_price = 0
    line_items.each do |item|
      total_price += item.price
    end
    total_price
  end
end