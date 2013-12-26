class User < ActiveRecord::Base
  has_many :stuffs , dependent: :destroy
  has_many :tags , dependent:  :destroy
  has_many :stuffs_tags ,through: :tags ,dependent: :destroy
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates(:password, presence: true,length: { maximum: 50 })

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
  
    def create_remember_token
      # Create the token.
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
