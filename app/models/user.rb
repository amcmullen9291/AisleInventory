class User < ApplicationRecord
  before_create :confirmation_token
  has_secure_password

      validates_presence_of :store_id, :message => "not entered"
      validates :password, confirmation: true
      validates_presence_of :password_confirmation
      validates_presence_of :email
      validates_presence_of :telephone
      validates_uniqueness_of :employeeInit

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['email'], uid: auth['uid'] || create_user_from_omniauth(auth))
  end

  # def self.create_user_from_omniauth(auth)
  #   create! do |user|
  #     user.provider = auth["info"]["provider"]
  #     user.uid = auth["info"]["uid"]
  #     user.name = auth["info"]["name"]
  #   end

    def self.find_or_create_by_omniauth(auth)
      oauth_email = auth["info"]["email"] || auth["info"]["uid"] || auth["info"]["provider"]
      self.where(:email => oauth_email).first_or_create do |user|
        user.password = SecureRandom.hex
      end
    end

  def first?(record)
    User.first == record
  end

  private
    def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

    def email_activate
      self.email_confirmed = true
      self.confirm_token = nil
      save!(:validate => false)
    end
end
