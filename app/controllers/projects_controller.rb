class ProjectsController < ApplicationController
  before_action :signed_in_user
  def index

    @stuffs = current_user.stuffs.where('stuffs.statu_code = ?', Stuff::STATU_CODE_AT_PROJECT)

  end

  def show
    @stuff = current_user.stuffs.find(params[:id])
    #@sub_items
    @sub_items = current_user.stuffs.where('parent_id = ?', params[:id])
  end

  def done
    @stuff = set_stuff
    @stuff.statu_code = Stuff::STATU_CODE_DONE
    if @stuff.save
      flash[:success] = "You done this stuff!"
      redirect_to projects_path
    end

  end

end
