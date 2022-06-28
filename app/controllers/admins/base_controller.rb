module Admins
  class BaseController < ActionController::Base
    layout 'application'

    def current_admin
      @current_admin ||= Administrator.first
    end
  end
end
