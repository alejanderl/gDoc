class Cycle < ActiveRecord::Base
  attr_accessible :description, :end_date, :start_date, :title, :tag_list, :creator, :contributor, :notes
  has_and_belongs_to_many :events 
  has_many :addresses, :as => :addressable
  validates_presence_of :title, :description
  acts_as_taggable
  has_many :favourites, :as => :favouritable, :dependent => :destroy

  has_many :taxonomizables, :as => :item, :dependent => :destroy
  has_many :terms, :through => :taxonomizables

  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates
  
  def videos
    videos = []
    self.events.each {|x| videos += x.videos}
    videos    
  end
    def audios
    audios = []
    self.events.each {|x| audios += x.audios}
    audios    
  end
  def photos
    photos = []
    self.events.each {|x| photos += x.photos}
    photos    
  end
  def documents
    documents = []
    self.events.each {|x| documents += x.documents}
    documents    
  end  

end
