class HomeController < ApplicationController
	  before_action :load_categories

	def index
	end

	def video
		require 'net/http'

		@videos = Video.all.order(order: :asc)
		@videos.each do |video|
			if video.img_url.empty?
				source = "http://vimeo.com/api/v2/video/#{video.vimeoid}.json"
				data = Net::HTTP.get_response(URI.parse(source)).body
				result = JSON.parse(data)
				video.update(img_url: result[0]['thumbnail_large'])
			end
		end
	end

	def info
		
	end

	def photo
		@images = Image.all
	end

  private
	  def load_categories
		  @links = Url.all.order(order: :asc)
	  end

end
