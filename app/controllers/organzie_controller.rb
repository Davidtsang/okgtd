class OrganzieController < ApplicationController
  before_action :signed_in_user
  def index
    @stuffs = current_user.stuffs.where("statu_code = ?", Stuff::STATU_CODE_AT_ORG)
  end

  def org
    @stuff = current_user.stuffs.find_by(id: params['id'])
  end

  def org_act
    @stuff = current_user.stuffs.find_by(id: params['id'])
    params['stuff']['deadline'] = nil if params['has_deadline'] != 'on'

    if @stuff.update(stuff_params)

      if @stuff.statu_code == Stuff::STATU_CODE_AT_SCHEDULE
        render :set_schedule
      else
        flash[:success] ='org ok!'
        redirect_to organzie_path
      end
    end

  end


  def set_schedule_act
    @stuff = current_user.stuffs.find_by(id: params['id'])
    @stuff.doing_date=params['stuff']['doing_date']
    if @stuff.save
      flash[:success] ='stuff added to schedule!'
      redirect_to organzie_path
    else
      render :set_schedule
    end
  end

  private

  def stuff_params
    params.require(:stuff).permit(:content, :plan_time, :statu_code, :deadline)
  end
end
