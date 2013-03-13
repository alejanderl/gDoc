class BroadcastVideoUploader
  
  def initialize(video_with_file)
    
    @video = video_with_file
    get_file(@video)
    
  end
  
  def get_file(witch_file)
    
    begin
      file = open witch_file.video_file.url
      my_file = File.open("public/#{witch_file.filename}","wb")
      my_file.write file.read
      my_file.close
      self.upload_file_youtube(my_file)
    rescue      
     
    end
    
  end
    
  def upload_file_youtube(file)

    yt_client ||= YouTubeIt::Client.new(:username => YouTubeITConfig.username , :password => YouTubeITConfig.password , :dev_key => YouTubeITConfig.dev_key)

    begin      
      yt_client.video_delete(@video.yt_id) if @video.yt_id.present?
      @video.yt_id=""
      yt_response = yt_client.video_upload( File.open("public/#{@video.filename}"), :title => @video.title,:description => @video.description, :category => 'People',:keywords => @video.terms_csv, :dev_tag => 'tagdev')     
     @video.yt_id = yt_response.unique_id if yt_response.unique_id.present?
    rescue
    end
    
    File.delete file.path
    
  end
    
end
