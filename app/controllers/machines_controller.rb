class MachinesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :edit, :destroy]

  def new
    @machine = current_user.machines.build
  end

  def show
    @machine = Machine.find(params[:id])
    @user = @machine.fastened
    counts_clip(@machine)

  end

  def create
    @machine = current_user.machines.build(machine_params)
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

  private

  def machine_params
    params.require(:machine).permit(:machine_name, :image, :kit_id, :motor_id, :esc_id, :servo_id, :recevier_id, :regulation, :other, :information)
  end
end
