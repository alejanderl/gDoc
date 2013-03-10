class Video < ActiveRecord::Base

  attr_accessible :title,  :date, :description, :duration, :format, :language, :license, :participant_id, :tag_list, :terms_of_use, :creator, :notes, :video_file
  
  mount_uploader :video_file, VideoUploader
  
  has_and_belongs_to_many :events 
  has_many :participates, :as => :participable  
  has_many :participants, :through => :participates

  validates_presence_of :title
  has_many :favourites, :as => :favouritable, :dependent => :destroy
  has_many :taxonomizables, :as => :item, :dependent => :destroy
  has_many :terms, :through => :taxonomizables
  acts_as_taggable
  def terms_list
    term_list = []
    self.terms.each do |term|
      term_list << term.name
    end
    term_list.join(",")
  end
  def filename
    self.video_file.path.split("/").last
  end
end
