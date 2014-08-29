class FavoritesController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    current_user.favorites.create(photo_id: @photo.id)
    redirect_to user_photo_path(@photo.user, @photo)
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to user_photo_path(@photo.user, @photo)
  end
end
