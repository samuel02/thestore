class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_admin,
                :authorize_admin,
                :current_cart,
                :current_customer,
                :authorize_customer
  before_filter :current_user

  private

  def authorize_admin
    unless current_user.admin?
      redirect_to login_path
    end
  end

  def authorize_customer
    unless current_user.customer?
      redirect_to login_path
    end
  end

  def current_user
    @current_user = current_admin || current_customer
  end



  def current_cart
    begin
      cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      return cart
    end

    cart
  end

  private

  def current_admin
    current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def current_customer
    current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end
end
