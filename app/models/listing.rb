class Listing < ActiveRecord::Base
  attr_accessible :description, :name, :price, :image
   has_attached_file :image, :styles => { :medium => "150x150>", :thumb => "100x100>" }, :default_url => "default.png",
                     :storage => :dropbox,
    				 :dropbox_credentials => Rails.root.join("config/dropbox.yml")
   				     

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
