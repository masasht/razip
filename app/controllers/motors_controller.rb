class MotorsController < ApplicationController
  
  def index
    @motors = Motor.all
  end

  def show
    @motor = Motor.find(params[:id])
    @machines = @motor.machines
    
    motor_post = @motor.class.name.downcase
    @post_item = motor_post + "_id"
    
    if logged_in?
      @user = current_user
      @micropost = @user.microposts.build(params[:motor_id])  #投稿フォーム用
      @microposts = @motor.microposts.order('created_at DESC').page(params[:page]).per(20)
    end
  end

  def new
    @motor = current_user.motors.build
  end
  
  def create
    @motor = current_user.motors.build(motor_params)
    if @motor.save
      flash[:success] = 'モーターを登録しました。'
      redirect_to motors_url
    else
      flash.now[:danger] = 'モーターの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @motor = Motor.find(params[:id])
  end
  
  def update
    @motor = Motor.find(params[:id])
    
    if @motor.update(motor_params)
      flash[:success] = 'モーターは更新されました'
      redirect_to motors_url
    else
      flash.now[:danger] = 'モーターは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
  end
  
  private

  def motor_params
    params.require(:motor).permit(:name, :image, :maker_id, :maker_url, :list_price, :brush, :sensor, :turn, :kv,
    :rpm, :torque, :voltage, :ampere, :information, :user_id)
  end
  
end

