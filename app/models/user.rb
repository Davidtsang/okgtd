class User < ActiveRecord::Base
  #has_many :stuff , dependent: :destroy
  has_many :stuffs , dependent: :destroy
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, length: { maximum: 50 },format: { with: VALID_EMAIL_REGEX })  
  validates(:password, presence: true,length: { maximum: 50 })
end
