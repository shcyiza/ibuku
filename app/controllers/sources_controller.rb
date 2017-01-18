class SourcesController < ApplicationController
	before_action :find_source, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		if params[:category].blank?
			@sources = Source.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@sources = Source.where(:category_id => @category_id).order("created_at DESC")
		end
	end

	def show
		if @source.reviews.blank?
			@average_review = 0
		else
			@average_review = @source.reviews.average(:rating).round(2)
		end
	end

	def new
		@source = current_user.sources.build
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def create
		@source = current_user.sources.build(source_params)
		@source.source_type = params[:source_type]
		if @source.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@source.source_type = params[:source_type]
		if @source.update(source_params)
			redirect_to source_path(@source)
		else
			render 'edit'
		end
	end

	def destroy
		@source.destroy
		redirect_to root_path
	end

	private

		def source_params
			params.require(:source).permit(:title, :description, :author, :category_id, :source_img, :source_type, :editors, :published_on)
		end

		def find_source
			@source = Source.find(params[:id])
		end

end
