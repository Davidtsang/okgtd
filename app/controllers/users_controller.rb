class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  def home
  end

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #set preset tags
      set_preset_tags(@user.id)
      sign_in @user
      flash[:success] = "Create a new user!"
      redirect_to @user
    else
      render 'new' 
    end#end if
  end#end fun

  private

  def set_preset_tags(user_id)
    @user = User.find(user_id)
    Tag::PRESET_TAGS.each do |t|
      @user.tags.create!(name: t)
    end
  end

  def user_params
    params.require(:user).permit(:email, :password,
    :password_confirmation)
  end


end
