class Permission
  
  def initialize(user)
    #@user= User.find(user.id)
    #allow :cycles, [:index, :show]
    %w[cycles events photos videos audios documents participants ].each do |controller|
      allow(controller, [:index, :show])
    end
    allow "devise/sessions", [:new, :destroy, :create]
    allow "devise/registrations", [:new, :edit, :destroy, :create]
   
    if user
      allow "devise/registrations", [:update]
      allow "favourites", [:new, :destroy, :create]
      #In order to acces to User methods create a new User
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
  
  def allow(controllers, actions, &block)
    @allowed_actions ||={}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end
  
  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end
  
  def allow_param(resources, attributes)
    @allowed_params ||= {}
    Array(resources).each do |resource|
      @allowed_params[resource] ||= []
      @allowed_params[resource] += Array(attributes)
    end
  end

  def allow_param?(resource, attribute)
    if @allow_all
      true
    elsif @allowed_params && @allowed_params[resource]
      @allowed_params[resource].include? attribute
    end
  end

  def permit_params!(params)
    if @allow_all
      params.permit!
    elsif @allowed_params
      @allowed_params.each do |resource, attributes|
        
        if params[resource].respond_to? :permit
          params[resource] = params[resource].permit(*attributes)
        end
      end
    end
  end

  
  
end
