class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper

  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_fastenings = user.fastenings.count
    @count_machines = user.machines.count
  end

  def counts_clip(machine)
    @count_fastened = machine.fastened.count
  end

  def admin_user
    unless current_user.admin?
      redirect_to root_url
    end
  end
end