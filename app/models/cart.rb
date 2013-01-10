class Cart < ActiveRecord::Base
  has_many :line_items


  def add_product(product)
    item = line_items.find_by_product_id(product)
    if item
      item.amount += 1
    else
      item = line_items.build(:product_id => product.id, :amount => 1)
    end
    item
  end

  def remove_product(product)
    logger.info "product = #{product.inspect}"
    item = line_items.find_by_product_id(product.id)
    logger.info "item = #{item.inspect}"
    if item
      item.amount -= 1
    end
    item
  end

  def total_price
    line_items.sum(&:price)
  end

end