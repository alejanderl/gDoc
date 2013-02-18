module TagsHelper
  
  def tags_autocomplete(var)
    
   
      render("tags/tags_autocomplete", :f => var ) 
      #("favourites/favourite", :t => var)

    
  end
    

end
