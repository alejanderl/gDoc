class Term < ActiveRecord::Base
  
  attr_accessible :name, :parent_id, :taxonomy_name
  
  has_many :taxonomizables
  has_many :items, :through => :taxonomizable
  
  validate  :validate_taxonomy?
  validates :name, :presence => true, :length => { :minimum => 3 }
  validates_uniqueness_of :name, :scope => :taxonomy_name, :case_sensitive => false

  TAXONOMIES = ["tech" ,"art","hist"]
    before_save :set_default_parentID
  before_save :get_parents_taxonomy

  
  def taxonomy    
    self.taxonomy_name    
  end
  

  
  def validate_taxonomy?
    
     TAXONOMIES.each do |key|
      
      return true if taxonomy_name == key
      
     end
    
  end
  
  def set_default_parentID
     self.parent_id = 0 if !self.parent_id.present? 
    
  end
  
  def get_parents_taxonomy
    
    if self.parent_id.present? && self.parent_id!=0   
      parent_term = Term.find(self.parent_id)
      self.taxonomy_name = parent_term.taxonomy_name
    end
  end
  

  

end
