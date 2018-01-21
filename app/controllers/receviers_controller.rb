class ReceviersController < ApplicationController
 def index
    @receviers = Recevier.all
  end

  def show
    @recevier = Recevier.find(params[:id])
  end

  def new
    @recevier = current_user.receviers.build
  end
  
  def create

    @recevier = current_user.receviers.build(recevier_params)

#    @recevier = current_user.receviers.build(params[:id])
    if @recevier.save
      flash[:success] = 'サーボを登録しました。'
      redirect_to receviers_url
    else
      flash.now[:danger] = 'サーボの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @recevier = Recevier.find(params[:id])
  end
  
  def update
    @recevier = Recevier.find(params[:id])
    
    if @recevier.update(recevier_params)
      flash[:success] = 'サーボは更新されました'
      redirect_to receviers_url
    else
      flash.now[:danger] = 'サーボは更新されませんでした'
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
