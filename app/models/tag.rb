class Tag < ActiveRecord::Base
  has_and_belongs_to_many :stuffs
  belongs_to :user
  PRESET_TAGS =['at office','at home', 'at meeting','at phone','at outside']
end
