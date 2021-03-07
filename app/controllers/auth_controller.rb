class AuthController < ApplicationController
    skip_before_action :authorize

    def google_oauth2
    end
end 