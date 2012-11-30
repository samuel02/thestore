class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.authenticate(params[:email], params[:password])
    if admin
      session[:admin_id] = admin.id
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_url
  end
end
