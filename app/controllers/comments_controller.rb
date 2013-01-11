class CommentsController < ApplicationController
  before_filter :authorize_customer

  def new
    @comment = Comment.new
    @parent_id = params[:parent_id]
    @product_id = params[:product_id]

    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.customer_id = @customer.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to product_path(@comment.product) }
      end
    end
  end


  private

  def authorize_customer
    if @current_user && @current_user.customer?
      @customer = @current_user
    else
      redirect_to root_path, notice: 'You must be logged in order to add a comment.' and return
    end
  end
end