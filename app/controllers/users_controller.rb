class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :destroy, :followings, :followers, :fastenings]
  before_action :correct_user_user, only: [:edit, :update, :destroy]

  def index
#    @users = User.all.page(params[:page])
    @search = User.search(params[:q])
    @users = @search.result
  end

  def show
    @user = User.find(params[:id])
#    @machine = @
#    @machine = current_user.machines.build  # form_for 用
    @machines = @user.machines.order('created_at DESC').page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end  
    
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'ユーザは正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザ は更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = 'ユーザを削除しました。'
    redirect_to root_url
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end

  def fastenings
    @user = User.find(params[:id])
    @fastenings = @user.fastenings.page(params[:page])
    @machines = @user.fastenings
    counts(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_introduction, :user_url, :site_name, :user_class)
  end
  
  def correct_user_user
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to @user
    end
  end

end
