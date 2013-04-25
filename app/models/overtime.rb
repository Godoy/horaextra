class Overtime < ActiveRecord::Base
  attr_accessible :description,  :start_overtime, :end_overtime, :user_id, :project_id
  validates_presence_of :description,  :start_overtime, :end_overtime, :user_id, :project_id

  belongs_to :user, :inverse_of => :overtimes
  belongs_to :project


 # validates :description, :start_overtime, :end_overtime, :user_id, :project_id, :presence => true
  after_create :deliver_notification
  
protected

  def deliver_notification
    Confirmation.registration_confirm(self).deliver
  end
  	
end 

  