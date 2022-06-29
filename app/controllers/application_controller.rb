class ApplicationController < ActionController::Base
  def current_admin
    @current_admin ||= Administrator.find(session[:administrator_id]) if session[:administrator_id]
  end
  helper_method :current_admin
end
