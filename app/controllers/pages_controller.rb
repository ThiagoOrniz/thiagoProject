class PagesController < ApplicationController

	def index
		if current_rep
			@rep = current_rep.email
		else
			@rep = ""
		end
	end

end
