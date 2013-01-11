class SessionsController < ApplicationController
  def new
    session[:return_to] ||= request.url
  end

  def create
    admin = Admin.authenticate(params[:email], params[:password])
    customer = Customer.authenticate(params[:email], params[:password])

    if admin
      session[:admin_id] = admin.id
      redirect_to session[:return_to]
    elsif customer
      session[:customer_id] = customer.id
      redirect_to session[:return_to]
    else
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    session[:customer_id] = nil
    redirect_to root_url
  end
end
