class ReviewsController < ApplicationController
	before_action :find_origin
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.origin_id = @origin.id
		@review.user_id = current_user.id

		if @review.save
			redirect_to origin_path(@origin)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to origin_path(@origin)
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to origin_path(@origin)
	end

	private

		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_origin
			@origin = Origin.find(params[:origin_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end

end
