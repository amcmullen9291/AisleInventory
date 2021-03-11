class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  helper_method :current_user, :logged_in?

  def error_page
    redirect_to '/users/user_error'
    flash.notice = "Wrong Path"
  end


    def current_user
        @user ||= User.find(session[:user_id]) if session[:user_id]
    end
      helper_method :current_use
    
    def authorize
      redirect_to root_path unless current_user
    end

    def logged_in?
      !!current_user
    end
    
end