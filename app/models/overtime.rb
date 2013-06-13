class Overtime < ActiveRecord::Base
  attr_accessible :description,  :start_overtime, :end_overtime, :user_id, :project_id, :status
  validates_presence_of :description,  :start_overtime, :end_overtime, :user_id, :project_id 

  belongs_to :user, :inverse_of => :overtimes
  belongs_to :project

  def self.rh
    ["luiz.alves@planb.com.br", "jacqueline.pereira@planb.com.br", "viviane.souza@planb.com.br","nayara.oliveira@planb.com.br"]
  end 

  def self.SumOvertimes(current_user)
   	overtimesApproveds = current_user.overtimes.where("status = 'approved'")
    overtime = 0
  	overtimesApproveds.each do | overtimesApproved |
  		overtime += (overtimesApproved.end_overtime - overtimesApproved.start_overtime).to_i
  	end
    overtime
  end 
   
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_user
      all.each do |overtime|
        csv << overtime.attributes.values_at(*column_user)
      end
    end
  end
end 



#def searchUser
  #  @overtime = Overtime.find(:all, :conditions => ["overtime_user = ? and start_overtime >= 2013-06-10 and end_overtime <=2013-07-30", params[:id]])
   #end