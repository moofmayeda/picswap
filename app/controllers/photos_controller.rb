class PhotosController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @photo = Photo.new
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.new(photo_params)
    if @photo.save
      flash[:notice] = "Photo added!"
      redirect_to user_photos_path
    else
      render('new')
    end
  end

private
  def photo_params
    params.require(:photo).permit(:description, :picture)
  end
end
