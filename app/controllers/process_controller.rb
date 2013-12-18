class ProcessController < ApplicationController
  before_action :signed_in_user
  
  def index
    @stuffs = current_user.stuffs.where("statu_code = ?",Stuff::STATU_CODE_AT_INBOX)
  end

  def needdo
    @stuff = current_user.stuffs.find_by(id: params['id'])
  end

  def doit
    @stuff = current_user.stuffs.find_by(id: params['id'])

  end

  def donot
    @stuff = current_user.stuffs.find_by(id: params['id'])
  end

  def donow
    @stuff = current_user.stuffs.find_by(id: params['id'])
  end

  def to_trash
    stuff = current_user.stuffs.find_by(id: params['id'])
    stuff.statu_code =Stuff::STATU_CODE_AT_TRASH
    stuff.save
    flash[:success] ='Moved to Trashcan!'
    redirect_to process_path
  end

  def to_ref
    stuff = current_user.stuffs.find_by(id: params['id'])
    stuff.statu_code =Stuff::STATU_CODE_AT_REF
    stuff.save
    flash[:success] ='Moved to Ref folder!'
    redirect_to process_path
  end

  def to_future
    stuff = current_user.stuffs.find_by(id: params['id'])
    stuff.statu_code =Stuff::STATU_CODE_AT_FUTURE
    stuff.save
    flash[:success] ='Moved to Future folder!'
    redirect_to process_path
  end

  def dolater
    @stuff = current_user.stuffs.find_by(id: params['id'])
  end

  def done
    stuff = current_user.stuffs.find_by(id: params['id'])
    stuff.statu_code =Stuff::STATU_CODE_DONE
    stuff.save
    flash[:success] ='YOU DONE THAT JOB!'
    redirect_to process_path
  end
end
