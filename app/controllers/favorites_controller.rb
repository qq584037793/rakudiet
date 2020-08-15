class FavoritesController < ApplicationController
　 before_action :logged_in_user

  def create
    @dish = Dish.find(params[:dish_id])
    @user = @dish.user
    current_user.favorite(@dish)
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def destroy
    @cook = Cook.find(params[:dish_id])
    current_user.favorites.find_by(cook_id: @cook.id).destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
