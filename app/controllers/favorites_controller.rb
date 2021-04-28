class FavoritesController < ApplicationController

  def create
    @spa = Spa.find(params[:spa_id])
    favorite = current_user.favorites.new(spa_id: @spa.id)
    favorite.save!
    redirect_to request.referer
  end

  def destroy
    @spa = Spa.find(params[:spa_id])
    favorite = current_user.favorites.find_by(spa_id: @spa.id)
    favorite.destroy
    redirect_to request.referer
  end
end
