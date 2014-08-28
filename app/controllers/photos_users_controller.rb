class Photos_Users < ApplicationController
  def create
    @photo = Photo.find(params[:id])
    stop
    @photo.users
    @current_user.id
  end
end
