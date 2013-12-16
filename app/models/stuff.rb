class Stuff < ActiveRecord::Base
  has_many :tag , through: :stuff_tag ,source: :tag_id
  #belongs_to :user
  
end
