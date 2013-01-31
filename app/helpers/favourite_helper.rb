module FavouriteHelper
  
  def favourite_button(var)
    
    favourited = current_user.favourites.where(:favouritable_id => var.id, :favouritable_type => var.class)
    
    if favourited.present?
      
      render("favourites/delete_favourite", :t => favourited ) if current_user.favourites.where(:favouritable_id => var.id, :favouritable_type => var.class).present?
      #("favourites/favourite", :t => var)
    else
      render("favourites/favourite", :t => var)
    end
    
  end
  
end
