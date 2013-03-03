class Taxonomizable < ActiveRecord::Base
  
  belongs_to :term
  belongs_to :taxonomizable, :polymorphic => true
  

  
end
