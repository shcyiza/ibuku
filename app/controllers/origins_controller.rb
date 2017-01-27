class OriginsController < ApplicationController
	before_action :find_origin, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		@search = Origin.search do
			fulltext params[:search]
		end
		@origins = @search
	end

	def show
		if @origin.reviews.blank?
			@average_review = 0
		else
			@average_review = @origin.reviews.average(:rating).round(2)
		end
		if current_user
			@note = Note.new(origin_id: @origin.id)
			@notes = @origin.notes.where(user: current_user).order("page ASC")
		end
	end

	def new
		@origin = current_user.origins.build
		@origin_types = OriginType.order('id ASC').all.map{ |c| [c.name, c.id] }
	end

	def create
		@origin = current_user.origins.build(origin_params)
		@origin.origin_type = params[:origin_type]
		if @origin.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@origin_types = OriginType.all.map{ |c| [c.name, c.id] }
	end

	def update
		@origin.origin_type = params[:origin_type]
		if @origin.update(origin_params)
			redirect_to origin_path(@origin)
		else
			render 'edit'
		end
	end

	def destroy
		@origin.destroy
		redirect_to root_path
	end

	private

		def origin_params
			params.require(:origin).permit(:title, :description, :author, :category_id, :origin_img, :origin_type_id, :editors, :published_on)
		end

		def note_params
      params.require(:note).permit(:origin_id, :reference, :quote)
    end

		def find_origin
			@origin = Origin.find(params[:id])
		end

end
