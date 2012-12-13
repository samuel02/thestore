class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_admin, :authorize_admin, :current_cart

  private

  def authorize_admin
    unless current_admin
      redirect_to login_path
    end
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
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
end
