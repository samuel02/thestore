class OrdersController < ApplicationController
  before_filter :authorize_admin, except: [:create, :new]

  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  def new
    @cart = current_cart

    if @cart.line_items.size <= 0
      redirect_to root_path, notice: 'You have no products in cart.' and return
    end

    @customer = current_customer || Customer.new

    @order = Order.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  def create
    if current_customer
      @customer = current_customer
    else
      redirect_to root_path, notice: 'You must be logged in order to place an order.' and return
    end

    @order = Order.new
    @cart = current_cart

    @order.customer_id = @customer.id
    @order.add_items(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(@cart)
        session[:cart_id] = nil
        format.html { redirect_to root_path, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
