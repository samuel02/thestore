class LineItemsController < ApplicationController
  before_filter :init_cart

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      @line_item.save
      format.html { redirect_to :root }
    end
  end

  def destroy
    product = Product.find(LineItem.find(params[:id]).product)
    @line_item = @cart.remove_product(product)

    if @line_item.amount <= 0
      @line_item.destroy
    else
      @line_item.save
    end

    respond_to do |format|
      format.html { redirect_to :root }
    end
  end

  private

  def init_cart
    @cart = current_cart
  end
end