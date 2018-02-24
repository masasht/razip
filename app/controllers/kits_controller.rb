class KitsController < ApplicationController
  before_action :admin_user, only: [:destroy]

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
    @col = "kit_id"
    
    if @kit.creator.blank?
      @kit.creator = 1
    end
    
    if @kit.editor.blank?
      @kit.editor = 1
    end
    
    @creator = User.find_by(id: @kit.creator)
    @editor = User.find_by(id: @kit.editor)
    @machines = @kit.machines.order(created_at: "DESC").page(params[:machine_page]).per(8)
    
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
    @kit = Kit.new
    @kit.creator = current_user.id
    @kit.editor = current_user.id
    @makers = Maker.where(supply_kit: true)
  end
  
  def create
    @makers = Maker.where(supply_kit: true)
    @kit = Kit.new(kit_params)
    @kit.creator = current_user.id
    @kit.editor = current_user.id
    
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
    @kit.editor = current_user.id
    @makers = Maker.where(supply_kit: true)
    
  end
  
  def update
    @kit = Kit.find(params[:id])
    @kit.editor = current_user.id
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
  
  def create_ownership
    @kit = Kit.find(params[:id])
    if params[:interest] == 'Want'
      current_user.want(@kit)
      flash[:success] = 'Want しました。'
    elsif params[:interest] == 'Have'
      current_user.unwant(@kit)
      current_user.have(@kit)
      flash[:success] = 'Have しました。'
    end
    redirect_back(fallback_location: root_path)
  end
  
  def destroy_ownership
    @kit = Kit.find(params[:id])

    if params[:interest] == 'Want'
      current_user.unwant(@kit) 
      flash[:success] = 'Want を解除しました。'
    end
    
    if params[:interest] == 'Have'
      current_user.unhave(@kit) 
      flash[:success] = 'Have を解除しました。'
    end
    redirect_back(fallback_location: root_path)
  end
    
  
  private

  def kit_params
    params.require(:kit).permit(:name, :maker_id, :maker_url, :list_price, :category, :drive_system, :information, :user_id, :affiliate,)
#    params.require(:kit).permit!
  end

end
