class Permission < Struct.new(:user)
  
  def allow?(controller, action)
    return true if controller == "devise/sessions"
    return true if controller == "users" 
    return true if  action.in?(%w[index show])
    
    if user
      return true if controller == "users" && action.in?(%w[edit update])
      return true if controller == "cycles" && action != "destroy"
      return true if user.roles.map {|t| t=="admin"} 
    end
    false
  end
  
end