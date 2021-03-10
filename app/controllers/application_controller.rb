class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  helper_method :current_user, :logged_in?

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
#  change this, down ....
    def path 
      redirect_to root_path
    end 
  
    def validate_user 
      @user = User.find(params[:id])
      if @user.blank?
        redirect_to new_interaction_path, flash.notice = 'Sorry.  This user is no longer available.'
      end
    end

    def validate_occasion 
      @occasion = Occasion.find(params[:id])
      if @occasion.blank?
        redirect_to new_occasion_path, flash.notice = 'Sorry.  This occasion is no longer available.'
      end
    end

    def validate_aisle 
      @aisle = Aisle.find(params[:id])
      if @aisle.blank?
        redirect_to new_aisle_path, flash.notice = 'Sorry.  This Aisle is no longer available.'
      end
    end

    def validate_card
      @card = Card.find(params[:id])
      if @card.blank?
        redirect_to new_card_path, flash.notice = 'Sorry.  This Card is no longer available.'
      end
    end

    def validate_notes 
      @note= Note.find(params[:id])
      if @note.blank?
        redirect_to new_notes_path, flash.notice = 'Sorry.  This opportunity is no longer available.'
      end
    end
    
    def validate_interaction 
      @interaction = Interaction.find(params[:id])
      if @interaction.blank?
        redirect_to new_interaction_path, flash.notice = 'Sorry.  This interaction is no longer available.'
      end
    end

    def validate_manufacturere
      @manufacturere = manufacturere.find(params[:id])
      if @manufacturere.blank?
        redirect_to new_manufacturere_path, flash.notice ='Sorry.  This manufacture is no longer available.'
      end
    end


end