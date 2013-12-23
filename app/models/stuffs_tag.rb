class StuffsTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :stuff

end
