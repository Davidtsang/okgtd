class Tag < ActiveRecord::Base
  has_many :stuffs_tags
  has_many :stuffs, through: :stuffs_tags
  belongs_to :user
  PRESET_TAGS =['at office','at home', 'at meeting','at phone','at outside']


end
