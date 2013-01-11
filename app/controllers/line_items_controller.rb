class LineItemsController < ApplicationController

  def create
    session[:return_to] ||= request.request_uri
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      @line_item.save
      logger.info session[:return_to]
      format.html { redirect_to session[:return_to] }
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
end