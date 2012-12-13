class LineItemsController < ApplicationController
  def create
    cart = current_cart
    product_id = params[:product_id]

    logger.debug "current_cart = #{cart}"

    @line_item = LineItem.new
    @line_item.cart_id = cart.id
    @line_item.product_id = product_id
    @line_item.amount = 1

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
