class MakersController < ApplicationController
  before_action :require_user_logged_in
  before_action :admin_user, only: [:index, :new, :edit, :destroy]

  def index
    @makers = Maker.all
  end

  def show
    @maker = Maker.find(params[:id])
  end

  def new
    @maker = current_user.makers.build  # form 用
  end

  def create
    @maker = current_user.makers.build(maker_params)
    if @maker.save
      flash[:success] = 'メーカーを登録しました。'
      redirect_to makers_url
    else
      flash.now[:danger] = 'メーカーの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @maker = Maker.find(params[:id])
  end

  def update
    @maker = Maker.find(params[:id])

    if @maker.update(maker_params)
      flash[:success] = 'メーカーは更新されました'
      redirect_to maker_url
    else
      flash.now[:danger] = 'メーカーは更新されませんでした'
      render :edit
    end
  end

  def destroy
  end

  private

  def maker_params
    params.require(:maker).permit(:maker_name, :official_url, :user_id, :supply_kit, :supply_motor, :supply_esc, :supply_servos, :supply_recevier)
  end

end
