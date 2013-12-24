class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end


  def nav_badge
    @statu_code_items =current_user.stuffs.all(
        :group => "statu_code",
        :select => 'statu_code ,COUNT(statu_code ) AS statu_num'
    )
  end



  #debug
  def var_dump(val)
    puts '-'*40
    puts val.to_s
    puts YAML::dump(val)
    puts '-'*40
  end
end
