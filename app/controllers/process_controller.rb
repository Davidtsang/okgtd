class ProcessController < ApplicationController
  before_action :signed_in_user
  
  def index
    @stuffs = current_user.stuffs.where("statu_code = ?",Stuff::STATU_CODE_AT_INBOX)
  end

  def update

  end

  def needdo
    @stuff = set_stuff
  end

  def doit
    @stuff = set_stuff

  end

  def donot
    @stuff = set_stuff
  end

  def donow
    @stuff = set_stuff
  end

  def to_trash
    stuff = set_stuff
    stuff.statu_code =Stuff::STATU_CODE_AT_TRASH
    stuff.save
    flash[:success] ='Moved to Trashcan!'
    redirect_to process_path
  end

  def to_ref
    stuff = set_stuff
    stuff.statu_code =Stuff::STATU_CODE_AT_REF
    stuff.save
    flash[:success] ='Moved to Ref folder!'
    redirect_to process_path
  end

  def to_future
    stuff = set_stuff
    stuff.statu_code =Stuff::STATU_CODE_AT_FUTURE
    stuff.save
    flash[:success] ='Moved to Future folder!'
    redirect_to process_path
  end

  def dolater
    @stuff = set_stuff
  end

  def done
    stuff = set_stuff
    stuff.statu_code =Stuff::STATU_CODE_DONE
    stuff.save
    flash[:success] ='YOU DONE THAT JOB!'
    redirect_to process_path
  end

  def to_org
    stuff = set_stuff
    stuff.statu_code =Stuff::STATU_CODE_AT_ORG
    stuff.save
    flash[:success] ='Moved to Organize folder!'
    redirect_to process_path
  end

  def to_other
    stuff = set_stuff
    stuff.statu_code =Stuff::STATU_CODE_AT_OTHER
    stuff.save
    flash[:success] ='Moved to waiting folder!'
    redirect_to process_path
  end

  private

  def set_stuff
    current_user.stuffs.find_by(id: params['id'])
  end
end
