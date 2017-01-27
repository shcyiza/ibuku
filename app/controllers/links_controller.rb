class LinksController < ApplicationController

  def create
    @link = Link.build(link_params)

    respond_to do |format|
      if @link.save
        @origin = @link.origin
        format.html { redirect_to :back, notice: 'Linked successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  def link_params
    params.require(:link).permit(:idea_id, :linkable_id, :linkable_type)
  end

end
