class AdminsController < ApplicationController
  before_filter :authorize_admin

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params[:admin])

    if @admin.save
      redirect_to root_url
    else
      render 'new'
    end
  end
end
