class ApplicationController < ActionController::Base
  before_action :authorize

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
      helper_method :current_user
    
      def authorize
        flash.notice = "Log into Aisles"

        redirect_to root_path unless current_user
      end
    end
