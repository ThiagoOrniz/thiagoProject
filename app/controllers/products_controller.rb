class ProductsController < ApplicationController
	before_action :find_product, only: [:show]

	def index
	@products = Product.all.order("name ASC"); 

	respond_to do |format|
			format.html
			format.json {render json: @products}
		end


	end

	def show

		respond_to do |format|
			format.html
			format.json {render json: @product}
		end

	end

	private

	def find_product
		@product = Product.find(params[:id])
	end
end
