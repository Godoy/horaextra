class Overtime < ActiveRecord::Base
  attr_accessible :description,  :start_overtime, :end_overtime, :user_id, :project_id, :status
  validates_presence_of :description,  :start_overtime, :end_overtime, :user_id, :project_id 

  belongs_to :user, :inverse_of => :overtimes
  belongs_to :project


  	
end 



#- Exibir, também no relatório de horas extras, o total de horas APROVADAS que o usuario possui



