class FavouritesController < ApplicationController
  
  def create
    @object = params[:favouritable_type].classify.constantize.find(params[:favouritable_id])
    @favourite = @object.favourites.build
    @favourite.user = current_user
    
    respond_to do |format|
      if @favourite.save

        format.js
        format.json { render json: @favourite,     status: :created, location: @favourite}
      else
        format.html { render action: "new" }
        format.json { render json: @favourite.errors,  status: :unprocessable_entity }
      end
    end
    
    
  end

  def destroy
    
    @favourite = Favourite.where(:favouritable_id => params[:favourite_id]).first
    @object = @favourite.favouritable_type.classify.constantize.find(@favourite.favouritable_id)
    current_user.favourites.find_by_favouritable_id( params[:favourite_id]).destroy

    #@favourite2.destroy 
        


    respond_to do |format|      
        format.html { redirect_to root_url }
        format.js
        format.json { render json: @favourite,     status: :created, location: @favourite}
     

    end
  end
end
