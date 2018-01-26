class ReceviersController < ApplicationController
  def index
    @receviers = Recevier.all
  end

  def show
    @recevier = Recevier.find(params[:id])
    @machines = @recevier.machines

    if logged_in?
      @user = current_user
      @micropost = @user.microposts.build(params[:recevier_id])  #投稿フォーム用
      @microposts = @recevier.microposts.order('created_at DESC').page(params[:page]).per(20)
    end    
  end

  def new
    @recevier = current_user.receviers.build
  end
  
  def create

    @recevier = current_user.receviers.build(recevier_params)

#    @recevier = current_user.receviers.build(params[:id])
    if @recevier.save
      flash[:success] = 'レシーバーを登録しました。'
      redirect_to receviers_url
    else
      flash.now[:danger] = 'レシーバーの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @recevier = Recevier.find(params[:id])
  end
  
  def update
    @recevier = Recevier.find(params[:id])
    
    if @recevier.update(recevier_params)
      flash[:success] = 'レシーバーは更新されました'
      redirect_to receviers_url
    else
      flash.now[:danger] = 'レシーバーは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
  end
  
  private

  def recevier_params
    params.require(:recevier).permit(:name, :image, :maker_id, :maker_url, :list_price, :frequency,
    :dimensions, :weight, :information, :user_id)
  end
  
end
