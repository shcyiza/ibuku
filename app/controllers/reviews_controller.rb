class ReviewsController < ApplicationController
	before_action :find_source
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.source_id = @source.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to source_path(@source)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to source_path(@source)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to source_path(@source)
	end

	private

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_source
			@source = Source.find(params[:source_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end

end
