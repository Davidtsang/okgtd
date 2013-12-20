class StuffsController < ApplicationController
  before_action :signed_in_user

  def show
    @stuff = set_stuff
  end

  def edit
    @stuff = set_stuff
  end

  def update
    @stuff = set_stuff
    params['stuff']['deadline'] = nil if params['has_deadline'] != 'on'

    if @stuff.update(stuff_params)

      if @stuff.statu_code == Stuff::STATU_CODE_AT_SCHEDULE
        render :set_schedule
      else
        flash[:success] ='edit ok!'
        redirect_to @stuff
      end
    end

  end

  def index
    @stuffs = current_user.stuffs.where('stuffs.statu_code > ?', Stuff::NEED_DOING_STUFF_MIN_VAL)
  end

  def new
    @stuff =current_user.stuffs.build
  end

  def next_action
    @stuffs = current_user.stuffs.where('stuffs.statu_code = ?', Stuff::STATU_CODE_AT_NEXT)
  end

  def schedule
    @stuffs = current_user.stuffs.where('stuffs.statu_code = ?', Stuff::STATU_CODE_AT_SCHEDULE)
  end

  def project
    @stuffs = current_user.stuffs.where('stuffs.statu_code = ?', Stuff::STATU_CODE_AT_PROJECT)
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

  def set_schedule_act
    @stuff = set_stuff
    #@stuff.doing_date= params['stuff']['doing_date']
    if @stuff.update(stuff_params)
      flash[:success] ='stuff added to schedule!'
      redirect_to @stuff
    else
      render :set_schedule
    end
  end

  private

  def set_stuff
    @stuff =current_user.stuffs.find_by_id(params[:id])
  end

  def stuff_params
    params.require(:stuff).permit(:content, :plan_time, :statu_code, :deadline,:doing_date)
  end

end
