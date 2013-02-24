class Project < ActiveRecord::Base


  attr_accessible :description, :name, :client_id, :user_id

  belongs_to :client
  belongs_to :user

  has_many :overtimes
end
