class LineItemsController < ApplicationController
  def create
    cart = current_cart
    product = Product.find(params[:product_id])

    @line_item = cart.add_product(product)

    logger.debug "@line_item = #{@line_item}"

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to :root }
      else
        format.html { redirect_to :root }
      end
    end
  end

  def destroy
  end
end
