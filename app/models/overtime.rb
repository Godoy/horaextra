class Overtime < ActiveRecord::Base
  attr_accessible :description,  :start_overtime, :end_overtime, :user_id, :project_id

  belongs_to :user, :inverse_of => :overtimes
  belongs_to :project


  validates :description, :start_overtime, :end_overtime, :user_id, :project_id, :presence => true

  	
end 

  