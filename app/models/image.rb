class Image < ActiveRecord::Base
  has_attached_file :img, :styles => { :medium => "500>x", :thumb => "40x40" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
end
