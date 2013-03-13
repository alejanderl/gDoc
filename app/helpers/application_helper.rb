module ApplicationHelper
  def edit_button var
    render "shared/buttons/edit_button", :t => var    
  end
  def add_related object
    render "shared/buttons/add_related", :t => object
  end
  
  def related_events_cycles object
    render "shared/related_objects"
  end

end
