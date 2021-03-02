class User < ApplicationRecord
    extend ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::OneTimePassword

    define_model_callbacks :create
    attr_accessor :otp_secret_key, :email

    has_secure_password
    has_one_time_password 
    validates_with PlaceboValidator
    
    validates_presence_of :store_id, :message => "not entered"
    validates :password, confirmation: true
    validates_presence_of :password_confirmation
    validates_presence_of :email
    validates_presence_of :employeeInit, :message => "required"
    validate_uniqueness_of :employeeInit
    validates :notes, length: { maximum: 150 }

    def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["info"]["name"]
      end
    end

end
