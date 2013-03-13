class VideosController < ApplicationController
  # GET /videos
  # GET /videos.json
  
  
  def upload_youtube
    yt_client
    video=Video.find params[:id]
    
    upload_the_video = BroadcastVideoUploader.new(video)
    
    
    if video.save    
      redirect_to video
    end
  end

  def index
    if params[:tag]
      @videos = Video.tagged_with(params[:tag])
    else
      @videos = Video.order("created_at").page(params[:page]).per(15)  
    end
    @search = Video.search(params[:q])
    @videos = @search.result.order("created_at").page(params[:page]).per(15)  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
      format.xml #index.xml.builder
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])

  respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @video }
  end
  end

  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(params[:video])
    @video.user_id = current_user.id
    add_terms(params["terms-id"],@video)
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])
    add_terms(params["terms-id"],@video)
    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    @yt_client.video_delete(@video.yt_id) if @video.yt_id.present?
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end
end
