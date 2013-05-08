class Overtime < ActiveRecord::Base
  attr_accessible :description,  :start_overtime, :end_overtime, :user_id, :project_id, :status
  validates_presence_of :description,  :start_overtime, :end_overtime, :user_id, :project_id 

  belongs_to :user, :inverse_of => :overtimes
  belongs_to :project
 
  def self.SumOvertimes(current_user)
  	#time = (:end_overtime -:start_overtime).strftime('%H:%M')
  	#time.sum
  	overtimesApproved = current_user.overtimes.where("status = 'approved'")
  	overtimesApproved.each do | overtimesApproved|
  		overtime = ("end_overtime - :start_overtime").to_s.sum
  	end
  	
  end 	
end 



#- Exibir, também no relatório de horas extras, o total de horas APROVADAS que o usuario possui



