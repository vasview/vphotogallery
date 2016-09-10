class PhotosController < ApplicationController
  def index
  	@photos = Photo.all
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  private

  def photo_params
  	params.require(:photo).permit(:id, :user_id, :image)
  end
end
