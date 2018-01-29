class ServosController < ApplicationController
  def index
    @q = Servo.ransack(params[:q])
    @servos = @q.result(distinct: true)
  end

  def search
    @q = Servo.search(search_params)
    @servos = @q.result(distinct: true)
  end

  def show
    @servo = Servo.find(params[:id])
    @machines = @servo.machines
    
    servo_post = @servo.class.name.downcase
    @post_item = servo_post + "_id"
    
    if logged_in?
      @user = current_user
      @micropost = @user.microposts.build(params[:servo_id])  #投稿フォーム用
      @microposts = @servo.microposts.order('created_at DESC').page(params[:page]).per(20)
    end
  end

  def new
    @servo = current_user.servos.build
  end
  
  def create

    @servo = current_user.servos.build(servo_params)

#    @servo = current_user.servos.build(params[:id])
    if @servo.save
      flash[:success] = 'サーボを登録しました。'
      redirect_to servos_url
    else
      flash.now[:danger] = 'サーボの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @servo = Servo.find(params[:id])
  end
  
  def update
    @servo = Servo.find(params[:id])
    
    if @servo.update(servo_params)
      flash[:success] = 'サーボは更新されました'
      redirect_to servos_url
    else
      flash.now[:danger] = 'サーボは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
  end

  private

  def search_params
    params.require(:q).permit!
  end

  def servo_params
    params.require(:servo).permit(:name, :image, :maker_id, :maker_url, :list_price, :servo_type, :profile,
    :speed_74, :torque_74, :dimensions, :weight, :information, :user_id, :speed_60, :speed_48, :torque_60, :torque_48)
  end
  
end