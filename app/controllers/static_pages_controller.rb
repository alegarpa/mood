class StaticPagesController < ApplicationController

	def home
		if logged_in?
			@feeling = current_user.feelings.build
		end
	end

	def help
	end

	def about
	end


end
