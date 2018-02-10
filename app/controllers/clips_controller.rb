class ClipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    machine = Machine.find(params[:machine_id])
    current_user.fasten(machine)
    flash[:success] = 'いいねしました。'
    redirect_to machine
  end

  def destroy
    machine = Machine.find(params[:machine_id])
    current_user.unfasten(machine)
    flash[:success] = 'いいねを解除しました。'
    redirect_to machine
  end
end
