class MachinesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :destroy]
  before_action :correct_user_machine, only: [:edit, :update, :destroy]
  
  def hello_kit
#    @kits = Kit.all
    @kits = Kit.where(maker_id: params[:machine][:maker_id])
  end
  
  def hello_motor
#    @kits = Kit.all
    @motors = Motor.where(maker_id: params[:machine][:maker_id])
  end
  
  def hello_esc
#    @kits = Kit.all
    @escs = Esc.where(maker_id: params[:machine][:maker_id])
  end
  
  def hello_servo
#    @kits = Kit.all
    @servos = Servo.where(maker_id: params[:machine][:maker_id])
  end
  
  def hello_recevier
#    @kits = Kit.all
    @receviers = Recevier.where(maker_id: params[:machine][:maker_id])
  end
  
  def index
    @search = Machine.search(params[:q])
    @machines = @search.result.page(params[:machine_page]).per(12)
  end


  def new
    @machine = current_user.machines.build
  end

  def show
    @machine = Machine.find(params[:id])
    @user = @machine.fastened
    counts_clip(@machine)
    
    unless @machine.machine_name.present?
      @machine.machine_name = @machine.kit.name
    end

    
    if logged_in?
      @user = current_user
      @micropost = @user.microposts.build(params[:machine_id])  #投稿フォーム用
      @microposts = @machine.microposts.order('created_at DESC').page(params[:page]).per(20)
    end
  end

  def create
    @machine = current_user.machines.build(machine_params)
    
    unless @machine.machine_name.present?
      @machine.machine_name =  ""
    end
    
    if @machine.kit_id.blank?
      @machine.kit_id = 1
    end
    
    if @machine.motor_id.blank?
      @machine.motor_id = 1
    end
    
    if @machine.esc_id.blank?
      @machine.esc_id = 1
    end
    
    if @machine.servo_id.blank?
      @machine.servo_id = 1
    end
    
    if @machine.recevier_id.blank?
      @machine.recevier_id = 1
    end
    
    if @machine.save
      flash[:success] = 'マシンを登録しました。'
      redirect_to @machine
    else
      @machines = current_user.machines.order('created_at DESC')
      flash.now[:danger] = 'マシンの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @machine = Machine.find(params[:id])
  end
  
  def update
    @machine = Machine.find(params[:id])
    
    if @machine.update(machine_params)
      flash[:success] = 'マシンは更新されました'
      redirect_to @machine
    else
      flash.now[:danger] = 'マシンは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy
    @user = current_user

    flash[:success] = 'マシンは削除されました'
    redirect_to @user
  end
  
  def fastened
    @machine = Machine.find(params[:id])
    @fastened = @machine.fastened(params[:page])
    
  end
  
#  def search
#    @search = Machine.search(params[:q])
#    @machines = @search.result
#  end
  
  private

  def machine_params
    params.require(:machine).permit(:machine_name, :image, :kit_id, :motor_id, :esc_id, :servo_id, :recevier_id, :regulation, :other, :information, :turn)
  end
  
  def correct_user_machine
    @machine = current_user.machines.find_by(id: params[:id])
    unless @machine
      redirect_to root_url
    end
  end
  
  
  
end
