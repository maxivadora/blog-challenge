module Admins
  class BaseController < ActionController::Base
    layout 'application'

    def current_admin
      @current_admin ||= Administrator.find(session[:administrator_id]) if session[:administrator_id]
    end
    helper_method :current_admin

    def authorize_admin!
      return true if current_admin

      redirect_to admins_login_path, alert: "You can't see this page. Please login"
    end
  end
end
