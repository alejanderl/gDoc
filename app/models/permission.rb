class Permission
  
  def initialize(user)
    #@user= User.find(user.id)
     allow :cycles, [:index, :show]
    %w[cycles events photos videos audios documents participants ].each do |controller|
    allow(controller, [:index, :show])
    end
    allow "devise/sessions", [:new, :destroy, :create]
    allow "devise/registrations", [:new, :edit, :destroy]
    
    if user
      
    allow "favourites", [:new, :destroy, :create]
    
      user_use = User.find(user.id)
      
      if user_use.roles.include? "redactor"
      
        %w[cycles events photos videos audios documents participants favourites ].each do |controller|
          allow(controller, [:update, :create, :destroy, :new, :edit])
        end
      end
     allow_all if user_use.roles.include?  "admin"

    end
    
  end
  
  def allow_all
    @allow_all = true
  end
  
  def allow(controllers, actions)
    @allowed_actions ||={}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = true
      end
    end
  end
  
  def allow?(controller, action)
    
    @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    
    
    
  end
  
end