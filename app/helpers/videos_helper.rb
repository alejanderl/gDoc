module VideosHelper
  
  def video_player(t)
    
    render("videos/partials/video_player", :video => t)
  end
  
end
