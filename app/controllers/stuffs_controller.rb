class StuffsController < ApplicationController
  before_action :signed_in_user

  def show
    @stuff = set_stuff
  end

  def edit
    @stuff = set_stuff
    @user_tags = current_user.tags.all.collect { |t| [t.name, t.id] }.unshift(['pls select', 0])
  end

  def update
    @stuff = set_stuff
    params['stuff']['deadline'] = nil if params['has_deadline'] != 'on'
    @stuff_tags = params['stuff']['stuffs_tags'].reject!(&:blank?)

    @stuff.update_tags(@stuff_tags)
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

  def destroy
    @stuff = set_stuff
    if @stuff.destroy
      flash[:success] = '已删除!'
      redirect_to stuffs_path
    end

  end

  def next_action
    @stuffs = current_user.stuffs.where('stuffs.statu_code = ?', Stuff::STATU_CODE_AT_NEXT)

  end

  def next_action_by_tag
    @stuffs = current_user.stuffs.joins(:tags).where('stuffs.statu_code = ? and tags.id =?',
                                        Stuff::STATU_CODE_AT_NEXT,params[:id])
    @tag = Tag.find(params[:id])
  end

  def waiting
    @stuffs = current_user.stuffs.
        where('stuffs.statu_code = ?', Stuff::STATU_CODE_AT_OTHER)
  end

  def schedule
    @stuffs = current_user.stuffs.where('stuffs.statu_code = ?', Stuff::STATU_CODE_AT_SCHEDULE)
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

  def done
    @stuff = set_stuff
    @stuff.statu_code = Stuff::STATU_CODE_DONE
    if @stuff.save
      flash[:success] = "You done this stuff!"
      redirect_to @stuff
    end
  end

  def trash
    @stuffs = current_user.stuffs.where('stuffs.statu_code = ?',
                                        Stuff::STATU_CODE_AT_TRASH)
  end

  private

  def set_stuff
    @stuff =current_user.stuffs.find_by_id(params[:id])
  end

  def stuff_params
    params.require(:stuff).permit(:content, :plan_time, :statu_code, :deadline,
                                  :doing_date, :parent_id)
  end

end
