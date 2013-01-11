class CartsController < ApplicationController

  def destroy
    Cart.destroy(@cart)
    redirect_to root_path
  end

end