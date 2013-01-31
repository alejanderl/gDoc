class FavouritesController < ApplicationController
  
  def create
    @object = params[:favouritable_type].classify.constantize.find(params[:favouritable_id])
    @favourite = @object.favourites.build
    @favourite.user = current_user
    
    respond_to do |format|
      if @favourite.save
        format.html { redirect_to root_url }
        format.js
        format.json { render json: @favourite,     status: :created, location: @favourite}
      else
        format.html { render action: "new" }
        format.json { render json: @favourite.errors,  status: :unprocessable_entity }
      end
    end
    
    
  end

  def destroy
    
    @favourite = Favourite.find(params[:favourite_id])
    @object = @favourite.favouritable_type.classify.constantize.find(@favourite.favouritable_id)
    @favourite.destroy
    #@favourite2.destroy 
        


    respond_to do |format|      
        format.html { redirect_to root_url }
        format.js
        format.json { render json: @favourite,     status: :created, location: @favourite}
     

    end
  end
end