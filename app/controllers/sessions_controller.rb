class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
# request.env['omniauth.auth']に、OmniAuthによってHashのようにユーザーのデータが格納されている。
    session[:user_id] = user.id
    flash[:primary] = 'ログインしました'
    redirect_to root_path
    
#    email = params[:session][:email].downcase
#    password = params[:session][:password]
#    if login(email, password)
#      flash[:success] = 'ログインしました。'
#      redirect_to root_url
#    else
#      flash.now[:danger] = 'ログインに失敗しました。'
#      render 'new'
#    end
  end

  def destroy
    session[:user_id] = nil
    flash[:primary] = 'ログアウトしました'
    redirect_to root_url
  end

  private

#  def login(email, password)
#    @user = User.find_by(email: email)
#    if @user && @user.authenticate(password)
#      # ログイン成功
#      session[:user_id] = @user.id
#      return true
#    else
#      # ログイン失敗
#      return false
#    end
#  end
end