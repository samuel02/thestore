class CommentsController < ApplicationController

def create
  if @current_user && @current_user.customer?
    @customer = @current_user
  else
    redirect_to root_path, notice: 'You must be logged in order to add a comment.' and return
  end

  @comment = Comment.new(params[:comment])
  @comment.customer_id = @customer.id

  respond_to do |format|
    if @comment.save
      format.html { redirect_to product_path(@comment.product) }
    end
  end
end

end