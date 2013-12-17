class StuffsController < ApplicationController
  def show
    @stuffs = Stuff.all
  end
  
  def new
    user = User.first
    @stuff =user.stuffs.build
  end
  
  def get_tags
    stuff_tag.find_by(tag_id: self.id)
  end

end
