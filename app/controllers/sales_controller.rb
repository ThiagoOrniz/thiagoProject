class SalesController < ApplicationController
	before_action :find_sale, only: [:show, :destroy]

	def index
		@sales = Sale.where(:rep_id => current_rep.id)
	end

	def show
		sale = find_sale
		@items = Item.where(:sale_id => (find_sale).id)
		
		sale.update_price(@items)
		
		@client = Client.find(sale.client_id)
		@total =0;
		
		@items.each do |item|
			@total += item.price * item.quantity
		end
	end
	
	def create
		@sale = Sale.new(sale_params)

		@sale.rep_id = current_rep.id
			
		if @sale.save			
			redirect_to @sale	
		else
			render 'new'
		end	
	end

	def destroy
		Item.destroy_all(:sale_id => @sale.id)
		@sale.destroy
		redirect_to root_path, notice: "Successfully deleted "
	end

	def new
		@sale = Sale.new
		@sale.items.build
	end

	private

	def sale_params
		params.require(:sale).permit(:client_id, items_attributes: [:id, :product_id, :quantity, :_destroy])
	end

	def find_sale
		@sale = Sale.find(params[:id])
	end
end