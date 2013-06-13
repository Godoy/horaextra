class Project < ActiveRecord::Base


  attr_accessible :description, :name, :client_id
  validates_presence_of :description, :name, :client_id

  belongs_to :client
  has_many :overtimes

  has_and_belongs_to_many :users
  	attr_accessible :user_ids
 	
end
