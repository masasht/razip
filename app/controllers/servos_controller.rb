class ServosController < ApplicationController
  def index
    @servos = Servo.all
  end

  def show
    @servo = Servo.find(params[:id])
    @machines = @servo.machines
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

  def servo_params
    params.require(:servo).permit(:name, :image, :maker_id, :maker_url, :list_price, :servo_type, :profile,
    :speed, :torque, :dimensions, :weight, :information, :user_id)
  end
  
end