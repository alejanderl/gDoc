class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles_mask
  # attr_accessible :title, :body
  
  has_many :favourites, :dependent => :destroy
  default_scope  :include => [ :favourites]
  
  after_create :default_role


  
  ROLES = %w[admin registered editor redactor]
  
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
    roles == ["registered"]
  end
  
end
