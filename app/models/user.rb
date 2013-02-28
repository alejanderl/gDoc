class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  acts_as_tagger

  
  has_many :favourites, :dependent => :destroy
   [:videos , :events ,:audios, :cycles, :documents, :photos].each do |element|
    has_many element ,:through => :favourites
  end
  default_scope  :include => [ :favourites]

  
  validate :email, :uniqueness => true
  
  before_create :default_role


  
  ROLES = %w[admin registered editor redactor ]
  
  
  
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  
  def role_symbols
    roles.map(&:to_sym)
  end
  
    private
    
  def default_role
    if User.count == 0
      self.roles = ["admin"]
    else
      self.roles = ["registered"]
    end
  end
  

end
