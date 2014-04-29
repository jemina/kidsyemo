class Listing < ActiveRecord::Base
	if Rails.env.development?
    attr_accessible :description, :name, :price, :image
    has_attached_file :image, :styles => { :medium => "150x150>", :thumb => "100x100>" }, :default_url => "default.png"
     validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
 else
  
  attr_accessible :description, :name, :price, :image
   has_attached_file :image, :styles => { :medium => "150x150>", :thumb => "100x100>" }, :default_url => "default.png",
                     :storage => :dropbox,
    				 :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    				 :path => ":style/:id_:filename"
   				     

	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
 end
end