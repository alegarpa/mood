class FeelingsController < ApplicationController

	before_action :logged_in_user, only: [:create]

	def create
		#input = Fee
		@feeling = current_user.feelings.new(feeling_params)
		if @feeling.save
			flash[:success] = "New Feelz Felt"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	private

		def feeling_params
			params.require(:feeling).permit(:status)
		end

		def correct_user
			@feeling = current_user.feelings.find_by(id: params[:id])
			redirect_to root_url if @feeling.nil?
		end

end
