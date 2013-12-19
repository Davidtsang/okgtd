class OrganzieController < ApplicationController
  def index
    @stuffs = current_user.stuffs.where("statu_code = ?", Stuff::STATU_CODE_AT_ORG)
  end

  def org
    @stuff = current_user.stuffs.find_by(id: params['id'])
    @plan_time = Stuff::PLAN_TIME
    @to_next_act = Stuff::STATU_CODE_AT_NEXT
    @to_schedule = Stuff::STATU_CODE_AT_SCHEDULE
    @to_project = Stuff::STATU_CODE_AT_PROJECT

  end

  def org_act

  end
end
