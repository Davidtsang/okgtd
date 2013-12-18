class StuffsController < ApplicationController
  def show
    @stuffs = Stuff.all
  end
  
  def new
    @stuff =current_user.stuffs.build
  end
  
  def get_tags
    stuff_tag.find_by(tag_id: self.id)
  end

  def create
    
    @stuff = current_user.stuffs.build(stuff_params)
    @stuff.statu_code = Stuff::STATU_CODE_AT_INBOX
    if @stuff.save
      flash[:success] = "Stuff push in Inbox!"
      redirect_to inbox_path
    else
      render 'stuffs/new'
    end
    
  end
  
  private
    
    def stuff_params
      params.require(:stuff).permit(:content)
    end
end
