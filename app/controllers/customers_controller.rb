class CustomersController < ApplicationController
  before_filter :authorize_admin, :only => :index

  def index
    @customers = Customer.all
  end

  def create
    @customer = Customer.new(params[:customer])

    if @customer.save
      @customer = Customer.authenticate(params[:customer][:email], params[:customer][:password])
      session[:customer_id] = @customer.id
      redirect_to new_order_path
    else
      @order = Order.new
      render 'orders/new'
    end
  end

  def show
    @customer = Customer.find(params[:id])

    unless @customer == @current_user || @current_user.admin?
      redirect_to root_path
    end

    @orders = Order.where("customer_id = ?", @customer.id)
  end

  def update
    @customer = Customer.find(params[:id])

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Product was successfully updated.' }
      else
        format.html { render action: "show" }
      end
    end
  end
end