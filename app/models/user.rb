class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stuffs , dependent: :destroy
  has_many :tags , dependent:  :destroy
  has_many :stuffs_tags ,through: :tags ,dependent: :destroy
  after_create :add_preset_tags

  private
    def add_preset_tags
      @user = User.find(self.id)
      Tag::PRESET_TAGS.each do |t|
        @user.tags.create!(name: t)
      end
    end
end
