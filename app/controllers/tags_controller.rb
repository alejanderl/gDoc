class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end
  def show
    @tag = Tag.tagged_with(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag }
    end

  end
end
