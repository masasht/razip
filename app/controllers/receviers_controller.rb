class ReceviersController < ApplicationController
  before_action :admin_user, only: [:new, :edit, :destroy]
  
  def index
    @search = Recevier.ransack(params[:q])
    @receviers = @search.result.reverse_order.page(params[:page]).per(9)
    @makers = Maker.where(supply_recevier: true)
  end
  
  def search
    @search = Recevier.search(params[:q])
    @receviers = @search.result.page(params[:page]).per(9)
    @makers = Maker.where(supply_recevier: true)
  end
  def show
    @recevier = Recevier.find(params[:id])
    @machines = @recevier.machines.order(created_at: "DESC").page(params[:machine_page]).per(8)

    #　↓ここがきれいじゃない
    recevier_post = @recevier.class.name.downcase
    @post_item = recevier_post + "_id"

    if logged_in?
      @user = current_user
      @micropost = @user.microposts.build(params[:recevier_id])  #投稿フォーム用
      @microposts = @recevier.microposts.order('created_at DESC').page(params[:page]).per(20)
    end    
  end

  def new
    @recevier = current_user.receviers.build
    @makers = Maker.where(supply_recevier: true)
  end
  
  def create
    @makers = Maker.where(supply_recevier: true)
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
    @makers = Maker.where(supply_recevier: true)
  end
  
  def update
    @recevier = Recevier.find(params[:id])
    @makers = Maker.where(supply_recevier: true)
    
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
    :dimensions, :weight, :information, :user_id, :channel)
  end
  
end
