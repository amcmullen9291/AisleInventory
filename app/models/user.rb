class User < ApplicationRecord
  attr_accessor :otp_secret_key, :email

  include ActiveModel::Validations
  include ActiveModel::OneTimePassword
  extend ActiveModel::Callbacks
  define_model_callbacks :create

  validates_with PlaceboValidator
  has_secure_password
  has_one_time_password 

  validates_presence_of :store_id, :message => "not entered"
  validates :password, confirmation: true
  validates_presence_of :password_confirmation
  validates_presence_of :email
  validates_presence_of :employeeInit, :message => "required"
  validates_uniqueness_of :employeeInit, :message => "already enrolled"
  validates :notes, length: { maximum: 150 } #not being persisted

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

end
