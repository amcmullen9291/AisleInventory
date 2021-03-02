class User < ApplicationRecord
    extend ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::OneTimePassword

    define_model_callbacks :create
    attr_accessor :otp_secret_key, :email

    has_secure_password
    has_one_time_password 

    validates_presence_of :telephone
    validates_presence_of :store_id, :message => "not entered"
    validates :password, confirmation: true, :message => "not entered"
    validates_presence_of :password_confirmation
    validates_presence_of :email
    validates_presence_of :EmployeeInit, :message => "not entered"
    validates :notes, length: { maximum: 150 }
end
