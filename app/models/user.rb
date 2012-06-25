class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.name = name.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :password, presence:true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

      def create_remember_token
          self.remember_token = SecureRandom.urlsafe_base64
      end
end
