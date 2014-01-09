class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stuffs , dependent: :destroy
  has_many :tags , dependent:  :destroy
  has_many :stuffs_tags ,through: :tags ,dependent: :destroy

end
