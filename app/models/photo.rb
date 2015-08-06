class Photo < ActiveRecord::Base
	has_attached_file :img, :styles => { :medium => "600>x" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
end
