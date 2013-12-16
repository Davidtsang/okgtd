class StuffController < ApplicationController
  def show
    @stuff = Stuff.all
  end
  
  def get_tags
    stuff_tag.find_by(tag_id: self.id)
  end

end
