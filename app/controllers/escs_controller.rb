class EscsController < ApplicationController
  before_action :admin_user, only: [:new, :edit, :destroy]
  
  def index
#    @escs = Esc.all
    @search = Esc.ransack(params[:q])
    @escs = @search.result.reverse_order.page(params[:page]).per(9)
    @makers = Maker.where(supply_esc: true)
    
  end

  def search
    @makers = Maker.where(supply_esc: true)
    @search = Esc.search(params[:q])
    @escs = @search.result.page(params[:page]).per(9)
  end

  def show
    @esc = Esc.find(params[:id])
    @machines = @esc.machines.order(created_at: "DESC").page(params[:machine_page]).per(8)
    
    #　↓ここがきれいじゃない
    esc_post = @esc.class.name.downcase
    @post_item = esc_post + "_id"
    
    
    if logged_in?
      @user = current_user
      @micropost = @user.microposts.build(params[:esc_id])  #投稿フォーム用
      @microposts = @esc.microposts.order('created_at DESC').page(params[:page]).per(20)
    end
  end

  def new
    @esc = current_user.escs.build
    @makers = Maker.where(supply_esc: true)
  end
  
  def create
    @esc = current_user.escs.build(esc_params)
    @makers = Maker.where(supply_esc: true)
    if @esc.save
      flash[:success] = 'ESCを登録しました。'
      redirect_to escs_url
    else
      flash.now[:danger] = 'ESCの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @esc = Esc.find(params[:id])
    @makers = Maker.where(supply_esc: true)
  end
  
  def update
    @esc = Esc.find(params[:id])
    @makers = Maker.where(supply_esc: true)
    
    if @esc.update(esc_params)
      flash[:success] = 'ESCは更新されました'
      redirect_to escs_url
    else
      flash.now[:danger] = 'ESCは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
  end
  
  private

  def esc_params
    params.require(:esc).permit(:name, :image, :maker_id, :maker_url, :list_price, :motor_type, :sencor,
    :input_current, :output_current_max, :output_current, :bec, :information, :user_id, :turn, :lipo, :life, :nimh, :nicd, :ohm )
  end
  
end
