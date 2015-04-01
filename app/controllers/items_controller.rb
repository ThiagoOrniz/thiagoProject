class ItemsController < ApplicationController
	before_action :find_item, only: [:show]

	def create
		@item = Item.new(item_params)
		
		if @item.save
			redirect_to @item
		else
			render 'new'
		end
	end

	def new
		@item = Item.new
	end

	private

	def item_params
		params.require(:item).permit(:product, :price, :quantity)
	end

	def find_item
		@item = Item.find(params[:id])
	end
end
