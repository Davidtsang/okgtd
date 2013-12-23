class Tag < ActiveRecord::Base
  has_many :stuffs_tags
  belongs_to :user
  PRESET_TAGS =['at office','at home', 'at meeting','at phone','at outside']
end
