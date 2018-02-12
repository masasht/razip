class ItemsController < ApplicationController
  before_action :require_user_name, only: [:index]
    
  def index
  end
end
