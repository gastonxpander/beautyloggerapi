module Api
  class ReviewsController < Api::BaseController
    before_action :correct_product, only: :destroy

    def index
      reviews = Review.where(product_id: params[:product_id])
      render json: reviews, root: false
    end

    def create
      review = Review.create(review_params)
      if review.save
        render json: review, root: false
      else
        render json: { error: 'Internal Server Error'}, status: :internal_server_error
      end
    end

    def destroy
      @review.destroy
      render json: {}, status: :no_content
    end

    private
      def review_params
        params.permit(:product_id, :description, :rating)
      end

      def correct_product
        @review = @current_product.reviews.find_by(id: params[:id])
        render json: { error: 'Review not found' }, status: :not_found if @review.nil?
      end
  end
end