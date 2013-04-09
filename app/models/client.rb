class Client < ActiveRecord::Base
  attr_accessible :name, :picture, :website, :image
  validates_presence_of :name, :image

  has_many :projects

   attr_accessor :delete_image
  before_validation { self.image.clear if self.delete_image == '1' }
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" },
  										:default_url => "/images/:style/missing.png"
  
end
