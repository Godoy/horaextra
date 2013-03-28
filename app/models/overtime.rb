class Overtime < ActiveRecord::Base
  attr_accessible :description, :end_date, :end_time, :start_date, :start_time, :user_id, :project_id, :default

  belongs_to :user, :inverse_of => :overtimes
  belongs_to :project


  validates :description, :end_date, :end_time, :start_date, :start_time, :user_id, :project_id, :presence => true

  def calculator
  	
  	Time.at(self.end_time - self.start_time).gmtime.strftime('%T')

  end
end
