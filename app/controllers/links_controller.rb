class LinksController < ApplicationController
before_action :set_link, only: [:destroy]
  def create
    @link = Link.build(link_params)

    respond_to do |format|
      if @link.save
        @origin = @link.origin
        format.html { redirect_back fallback_location: fallback_location, notice: 'Linked successfully.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'unlinked successfully.' }
      format.json { head :no_content }
    end
  end

  def set_link
    @link = Link.find(params[:id])
  end


  def link_params
    params.require(:link).permit(:idea_id, :linkable_id, :linkable_type)
  end

end
