class ApplicationController < ActionController::Base
  before_action :authorize

    def current_user
        @user ||= User.find(session[:user_id]) if session[:user_id]
      end
      helper_method :current_user
    
      def authorize
        redirect_to root_path unless current_user
        flash.notice = "Sign Into AisleInventroy"
      end
    end