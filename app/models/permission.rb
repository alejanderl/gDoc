class Permission < Struct.new(:user)
  
  def allow?(controller, action)
    
    return true if  action.in?(%w[index show])
    return true if controller == "devise/sessions"
    return true if controller == "devise/registrations"
    return true if controller == "users"
    
    if user
      
      if user.roles.include? "registered"
        return true if controller.include? "devise"
        return false  if  action.in?(%w[edit update destroy])
      end
      
      if user.roles.include? "redactor"
        return true if  action.in?(%w[edit update destroy])
      end
      
     if user.roles.include? "admin"
        return true  
     end
     
    end
    
    false
    
  end
  
end