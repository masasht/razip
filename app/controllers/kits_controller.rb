class KitsController < ApplicationController
  
  def index
    @kits = Kit.all
  end

  def show
    @kit = Kit.find(params[:id])
    @machines = @kit.machines
  end

  def new
    @kit = current_user.kits.build
  end
  
  def create
    @kit = current_user.kits.build(kit_params)
    if @kit.save
      flash[:success] = 'キットを登録しました。'
      redirect_to kits_url
    else
      flash.now[:danger] = 'キットの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @kit = Kit.find(params[:id])
  end
  
  def update
    @kit = Kit.find(params[:id])
    
    if @kit.update(kit_params)
      flash[:success] = 'キットは更新されました'
      redirect_to kits_url
    else
      flash.now[:danger] = 'キットは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
  end
  
  private

  def kit_params
    params.require(:kit).permit(:name, :image, :maker_id, :maker_url, :list_price, :category, :drive_system, :information, :user_id)
  end
  
end
