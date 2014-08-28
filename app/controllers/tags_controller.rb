class TagsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
    @tag = @photo.tags.create(user_id: params[:tag][:user_id])
    redirect_to user_photo_path(@photo.user, @photo)
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to user_photo_path(@photo.user, @photo)
  end
end
