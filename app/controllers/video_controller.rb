class VideoController < ApplicationController
	def show
		@id = Video.find(params[:id]).vimeoid
	end
end
