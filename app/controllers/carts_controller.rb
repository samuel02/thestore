class CartsController < ApplicationController

  def destroy
    Cart.destroy(current_cart)
    redirect_to root_path
  end

end