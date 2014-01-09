class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in_user
    redirect_to new_user_session_path, notice: "请先登录。" unless user_signed_in?
  end



  #debug
  def var_dump(val)
    puts '-'*40
    puts val.to_s
    puts YAML::dump(val)
    puts '-'*40
  end
end
