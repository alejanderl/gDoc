module ApplicationHelper
  def edit_button var
    render "shared/buttons/edit_button", :t => var    
  end
  def add_related object
    render "shared/buttons/add_related", :t => object
  end
  
  def related_events_cycles object
    render "shared/related_objects", :t => object
  end
  
  def related_objects_min(t)
    if allow? "photos", "create" 
      render "shared/related_objects/related_objects_min", :object => t
    end
  end
  
  def related_parent(object)
    
    render "shared/related_objects/related_parent", :object => object
    
  end
  
  def image_preview  object, form
    
    render "photos/partials/image_preview",{ :f => form, :object => object}
    
  end

end
