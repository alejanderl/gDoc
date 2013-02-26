class TaxonomiesController < ApplicationController
  

  def index
   
    @terms = Term.all
    
    @term = Term.new
    

    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @terms}
    end
      
  end
def new
end
def show
end

def edit
  
  @term = Term.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @terms}
    end
  
end


  def create
    
    @term = Term.new(params[:term])
    
    respond_to do |format|
      if @term.save
        format.html {redirect_to(taxonomies_url, notice: t('messages.term_created'))}
      else
        format.html {redirect_to(taxonomies_url, notice: t('messages.term_not_created'))}
      end
    end
    
    
  end
  
  def update
    
    @term =  Term.find(params[:id])
    respond_to do |format|
     if @term.update_attributes(params[:term])
        format.html {redirect_to(taxonomies_url, notice: t('messages.term_created'))}
      else
        format.html {redirect_to(taxonomies_url, notice: t('messages.term_not_created'))}
     end
   end
    
  end
  
  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @term = Term.find(params[:id])
    @term.destroy

    respond_to do |format|
      format.html { redirect_to taxonomies_url }
      format.js
      format.json { head :no_content }
    end
  end
end
  