class ToppagesController < ApplicationController
  before_action :require_user_name, only: [:index]
  
  def index
    @new_machines = Machine.order(created_at: "DESC").page(params[:machine_page]).per(8)
    
    @new_kits = Kit.order(created_at: "DESC").first(6)
    @kit_link = "kits"
    
    @new_motors = Motor.order(created_at: "DESC").first(6)
    @motor_link = "motors"
    
    @new_escs = Esc.order(created_at: "DESC").first(6)
    @esc_link = "escs"
    
    @new_servos = Servo.order(created_at: "DESC").first(6)
    @servo_link = "servos"
    
    @new_receviers = Recevier.order(created_at: "DESC").first(6)
    @receiver_link = "receviers"

    items = Kit.order(created_at: "DESC").first(6) + Motor.order(created_at: "DESC").first(6) + Esc.order(created_at: "DESC").first(6) + Servo.order(created_at: "DESC").first(6) + Recevier.order(created_at: "DESC").first(6)
    @items = items.first(18)
    
    if logged_in?
      @user = current_user
      @micropost = current_user.microposts.build  #投稿フォーム用
      @microposts = Micropost.order('created_at DESC').first(8)
    end
  end
  
  def contact
  end

  def privacy
  end
  
  def about
  end

end
