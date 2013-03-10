class AppearanceController < ApplicationController
  def show
    @appearance = Appearance.first

    respond_to do |format|
      format.html
      format.json {render json: @appearance}
    end
  end

  def edit
    @appearance = Appearance.first

  end

  def update
    @appearance = Appearance.first

    respond_to do |format|
      if @appearance.update_attributes(params[:appearance])
        format.html { redirect_to @appearance, notice: 'Appearance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appearance.errors, status: :unprocessable_entity }
      end
    end


  end
end
