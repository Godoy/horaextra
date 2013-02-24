class Client < ActiveRecord::Base
  attr_accessible :name, :picture, :website

  has_many :projects
  
end
