class User < ActiveRecord::Base
  #has_many :stuff , dependent: :destroy
  validates(:email, presence: true)  
end
