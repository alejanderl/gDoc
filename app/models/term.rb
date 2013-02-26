class Term < ActiveRecord::Base
  
  attr_accessible :name, :parent_id, :taxonomy_name
  
  has_many :taxonomizables
  has_many :items, :through => :taxonomizable
  
  validate  :validate_taxonomy?
  validates :name, :presence => true, :length => { :minimum => 3 }
  validates_uniqueness_of :name, :scope => :taxonomy_name, :case_sensitive => false

  TAXONOMIES = ["tech" ,"art","hist"]
  
  
  def taxonomy    
    self.taxonomy_name    
  end
  
  
  
  def validate_taxonomy?
    
     TAXONOMIES.each do |key|
      
      return true if taxonomy_name == key
      
     end
    
  end
  

end
