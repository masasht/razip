class EscsController < ApplicationController
  def index
    @escs = Esc.all
  end

  def show
    @esc = Esc.find(params[:id])
    @machines = @esc.machines
    
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
  end
  
  def create
    @esc = current_user.escs.build(esc_params)
    if @esc.save
      flash[:success] = 'モーターを登録しました。'
      redirect_to escs_url
    else
      flash.now[:danger] = 'モーターの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @esc = Esc.find(params[:id])
  end
  
  def update
    @esc = Esc.find(params[:id])
    
    if @esc.update(esc_params)
      flash[:success] = 'モーターは更新されました'
      redirect_to escs_url
    else
      flash.now[:danger] = 'モーターは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
  end
  
  private

  def esc_params
    params.require(:esc).permit(:name, :image, :maker_id, :maker_url, :list_price, :motor_type, :sensor,
    :input_current, :output_current_max, :output_current, :bec, :information, :user_id, :turn, :battery_type => [])
  end
  
end