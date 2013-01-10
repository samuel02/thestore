class CustomersController < ApplicationController
  before_filter :authorize_admin, :only => :index

  def index
    @customers = Customer.all
  end

  def create
    @customer = Customer.new(params[:customer])

    if @customer.save
      redirect_to new_order_path
    else
      render 'order/new'
    end
  end
end