class OwnershipsController < ApplicationController
  def create
    if params[:interest] == 'Want'
      current_user.want(params)
      flash[:success] = 'Want しました。'
    end
    
    if params[:interest] == 'Have'
      current_user.want(params)
      flash[:success] = 'Have しました。'
    end
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])

    if params[:interest] == 'Want'
      current_user.unwant(@item) 
      flash[:success] = '商品の Want を解除しました。'
    end

    redirect_back(fallback_location: root_path)
  end
end
