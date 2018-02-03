class KitsController < ApplicationController
  before_action :admin_user, only: [:new, :edit, :destroy]

  def index
#    @kits = Kit.all
    @search = Kit.ransack(params[:q])
    @kits = @search.result.reverse_order.page(params[:page]).per(9)
    @makers = Maker.where(supply_kit: true)
    
  end

  def search
    @makers = Maker.where(supply_kit: true)
    @search = Kit.search(params[:q])
    @kits = @search.result.page(params[:page]).per(9)
  end


  def show
    @kit = Kit.find(params[:id])
    @machines = @kit.machines
    
    #　↓ここがきれいじゃない
    kit_post = @kit.class.name.downcase
    @post_item = kit_post + "_id"
    
    if logged_in?
      @user = current_user
      @micropost = @user.microposts.build(params[:kit_id])  #投稿フォーム用
      @microposts = @kit.microposts.order('created_at DESC').page(params[:page]).per(20)
    end
  end

  def new
    @kit = current_user.kits.build
    @makers = Maker.where(supply_kit: true)
  end
  
  def create
    @makers = Maker.where(supply_kit: true)
    @kit = current_user.kits.build(kit_params)

    if @kit.save
      flash[:success] = 'キットを登録しました。'
      redirect_to kit_url(@kit.id)
    else
      flash.now[:danger] = 'キットの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @kit = Kit.find(params[:id])
    @makers = Maker.where(supply_kit: true)
    
  end
  
  def update
    @kit = Kit.find(params[:id])
    @makers = Maker.where(supply_kit: true)
    
    if @kit.update(kit_params)
      flash[:success] = 'キットは更新されました'
      redirect_to kit_url(@kit.id)
    else
      flash.now[:danger] = 'キットは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
  end
  
  private

  def kit_params
    params.require(:kit).permit(:name, :maker_id, :maker_url, :list_price, :category, :drive_system, :information, :user_id, :image,)
#    params.require(:kit).permit!
  end

end
