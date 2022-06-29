module Admins
  class SessionsController < BaseController
    def new; end

    def create
      @admin = Administrator.find_by_email(session_params[:email])

      if @admin
        session[:administrator_id] = @admin.id
        redirect_to admins_posts_path, notice: 'Login successfully'
      else
        flash[:alert] = 'Invalid email or password. Please try again!.'
        render :new, status: :unauthorized
      end
    end

    def destroy
      session[:administrator_id] = nil
      redirect_to admins_login_path, status: :see_other, notice: 'Logged out successfully.'
    end

    private

    def session_params
      params.permit(:email, :password)
    end
  end
end
