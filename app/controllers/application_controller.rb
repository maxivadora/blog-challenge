class ApplicationController < ActionController::Base
  def current_admin
    @current_admin ||= Administrator.find(session[:administrator_id]) if session[:administrator_id]
  end
  helper_method :current_admin

  def authorize_admin!
    redirect_to admins_login_path, status: :unauthorized, notice: "You can't see this page. Please login" unless current_admin
  end
end
