class CyclesController < ApplicationController
  # GET /cycles
  # GET /cycles.json
  include TinyMCE::Rails::Helper  

  def index
    if params[:tag]
      @cycles = Cycle.tagged_with(params[:tag])
    else
      @cycles = Cycle.order("created_at").page(params[:page]).per(15)
   end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cycles }
    end
  end

  # GET /cycles/1
  # GET /cycles/1.json
  def show

    if params[:tag]
      @cycles = Cycle.tagged_with(params[:tag])
    else
      @cycle = Cycle.find(params[:id], :include => :terms)
  #    @cycles = Cycle.all
   end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cycle }
    end
  end

  # GET /cycles/new
  # GET /cycles/new.json
  def new
    @cycle = Cycle.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cycle }
    end
  end

  # GET /cycles/1/edit
  def edit
    @cycle = Cycle.find(params[:id])
  end

  # POST /cycles
  # POST /cycles.json
  def create
    @cycle = Cycle.new(params[:cycle])
    @cycle.user_id = current_user.id
    if params[:terms-id]
      params[:terms-id].each do |terms_ids|
        terms_ids.split.each do |term_id|
          @cycle.terms = Term.find term_id if term_id > 0
        end
      end
      debugger
    end
    respond_to do |format|
      if @cycle.save
        format.html { redirect_to @cycle, notice: 'Cycle was successfully created.' }
        format.json { render json: @cycle, status: :created, location: @cycle }
      else
        format.html { render action: "new" }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cycles/1
  # PUT /cycles/1.json
  def update
    @cycle = Cycle.find(params[:id])

    respond_to do |format|
      if @cycle.update_attributes(params[:cycle])
        format.html { redirect_to @cycle, notice: 'Cycle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycles/1
  # DELETE /cycles/1.json
  def destroy
    @cycle = Cycle.find(params[:id])
    @cycle.destroy

    respond_to do |format|
      format.html { redirect_to cycles_url }
      format.json { head :no_content }
    end
  end
  
  def current_resource
    @current_resource ||= Cycle.find(params[:id]) if params[:id]
  end
end
