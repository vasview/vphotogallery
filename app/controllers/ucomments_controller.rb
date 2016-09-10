class UcommentsController < ApplicationController
  def index
  	@ucomments = Ucomment.all
  end

  def show
  	@ucomment = Ucomment.find(params[:id])
  end

  def create
  	@photo = Photo.find(params[:photo_id])
	@ucomment = @photo.ucomments.build(ucomment_params)
	if @ucomment.save
		redirect_to photo_path(@photo)
	else 
		flash[:error] = "can't save!"
	end
  end

  def destroy
  	@photo = Photo.find(params[:photo_id])
	@ucomment = Ucomment.find(params[:id])
	@ucomment.destroy

	redirect_to photo_path(@photo)
  end

  private

  def ucomment_params
  	params.require(:ucomment).permit(:body, :score, :user_id, :photo_id)
  end

end
