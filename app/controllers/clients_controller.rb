class ClientsController < ApplicationController
	before_action :find_client, only: [:show, :edit, :update, :destroy]
	
	def index
		@clients = Client.all.order("name ASC");
	end

	def show
	end

	def create

		@client = Client.new(client_params)
		@client.rep_id = current_rep.id

		if @client.save
			redirect_to @client
		else
			render 'new'
		end
	end

	def new
		@client = Client.new
	end

	def edit
	end

	def update
		if @client.update(client_params)
			redirect_to @client

		else
			render 'edit'
		end
	end

	def destroy
		@client.destroy
		redirect_to root_path
	end

	private

	def client_params
		params.require(:client).permit(:name, :address, :phone, :email, :rep_id)
	end

	def find_client
		@client = Client.find(params[:id])
	end
end
