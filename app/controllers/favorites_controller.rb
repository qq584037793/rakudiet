class FavoritesController < ApplicationController
　 before_action :logged_in_user

  def create
    @cook = Cook.find(params[:cook_id])
    @user = @cook.user
    current_user.favorite(@cook)
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  def destroy
    @cook = Cook.find(params[:cook_id])
    current_user.favorites.find_by(cook_id: @cook.id).destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end
end
