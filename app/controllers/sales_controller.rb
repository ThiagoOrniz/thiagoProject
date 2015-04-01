class SalesController < ApplicationController
	before_action :find_sale, only: [:show]

	def index
		@sales = Sale.all;
	end

	def show
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

	def new
		@clients = Client.all
		@sale = Sale.new
	end

	private

	def sale_params
		params.require(:sale).permit(:date, :client, :rep, :item)
	end

	def find_sale
		@sale = Sale.find(params[:id])
	end
end