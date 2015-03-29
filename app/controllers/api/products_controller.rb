module Api
  class ProductsController < Api::BaseController
    before_action :correct_user, only: :destroy

    def index
      products = @current_user.products
      render json: products, root: false
    end

    def show
      product = Product.find(params[:id])
      render json: product, root: false
    end

    def create
      product = @current_user.products.build(product_params)
      if product.save
        render json: product, root: false
      else
        render json: { error: 'Internal Server Error'}, status: :internal_server_error
      end
    end

    def destroy
      @product.destroy
      render json: {}, status: :no_content
    end

    private
      def product_params
        params.permit(:name, :description)
      end

      def correct_user
        @product = @current_user.products.find_by(id: params[:id])
        render json: { error: 'Product not found' }, status: :not_found if @product.nil?
      end
  end
end