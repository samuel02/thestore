class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_admin, :authorize_admin

  private

  def authorize_admin
    unless current_admin
      redirect_to login_path
    end
  end

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
end
