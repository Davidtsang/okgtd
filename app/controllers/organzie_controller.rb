class OrganzieController < ApplicationController
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
      flash[:success] =YAML::dump(params)
      redirect_to organzie_path

    end

  end

  private

    def stuff_params
      params.require(:stuff).permit(:plan_time, :statu_code, :deadline)
    end
end
