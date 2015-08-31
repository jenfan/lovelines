class Video < ActiveRecord::Base
	before_update :all_index_to_nil

	def all_index_to_nil
		Video.update_all(to_index:false) if to_index
	end
end
