class ToppagesController < ApplicationController
  
  def index
    @new_machines = Machine.order(created_at: "DESC").first(6)
    
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


    
    if logged_in?
      @user = current_user
      @micropost = current_user.microposts.build  #投稿フォーム用
      @microposts = current_user.feed_microposts.order('created_at DESC').page(params[:page]).per(6)
    end
  end
  
  
  
  
  
end
