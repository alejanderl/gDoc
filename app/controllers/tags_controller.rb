class TagsController < ApplicationController
  def index

#    @user_tags = current_user.owned_tags

    @photos = current_user.collections.find(params[:photo_id])    
    @item = @photos.items.find(params[:id])
    @user_items = current_user.find_all(params[:tag]).photos
#    @user_photos_tagged = current_user.tag(@some_photo, :with => params[:tag], :on => :photos)


  end


  def show
#    @tag = Participant.tagged_with(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end

  end
end
