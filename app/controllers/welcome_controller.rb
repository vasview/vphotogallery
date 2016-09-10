class WelcomeController < ApplicationController
  def index
  	@photos = Photo.all
  end

  def show
  	@photo = Photo.find(params[:id])
    @rating = @photo.ucomments.average(:score)
  end

  private

  def welcome_params
  	params.require(:photo).permit(:id, :caption, :user_id, :image)
  end
end
