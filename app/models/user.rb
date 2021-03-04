class User < ApplicationRecord
  include ActiveModel::Validations
  validates_with PlaceboValidator

  before_create :confirmation_token
  has_secure_password

  # validates_presence_of :store_id, :message => "not entered"
  # validates :password, confirmation: true
  # validates_presence_of :password_confirmation
  # validates_presence_of :email
  # validates_presence_of :employeeInit, :message => "required"
  # validates_uniqueness_of :employeeInit, :message => "already enrolled"
  # validates :notes, length: { maximum: 150 } #not being persisted


  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['email'], uid: auth['uid'] || create_user_from_omniauth(auth))
  end

  def self.create_user_from_omniauth(auth)
    create! do |user|
      user.provider = auth["info"]["provider"]
      user.uid = auth["info"]["uid"]
      user.name = auth["info"]["name"]
    end
  end

  private
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
end
