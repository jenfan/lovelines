class HomeController < ApplicationController
	  before_action :load_categories

	def index
		@video = Video.where(to_index: true).first
	end

	def video
		require 'net/http'

		@videos = Video.all.order(created_at: :desc).order(order: :asc)
		@videos.each do |video|
			if video.img_url.empty?
				source = "http://vimeo.com/api/v2/video/#{video.vimeoid}.json"
				data = Net::HTTP.get_response(URI.parse(source)).body
				result = JSON.parse(data)
				video.update(img_url: result[0]['thumbnail_large'])
			end
		end
	end

	def about
		@about = About.last
	end

	def blog
			@blogs = Blog.all.order(created_at: :desc)
	end	

	def photo
		images = Photo.all.order(created_at: :desc)
		@images_odd = []
		@images_even = []
		images.each_with_index do |photo, index|
			(index.even? ? @images_odd : @images_even) << { small: photo.img.url, large: photo.img.url(:medium) }
		end
		# raise @images_odd.first[:small].inspect
	end

  private
	  def load_categories
		  @links = Url.all.order(order: :asc)
	  end

end
