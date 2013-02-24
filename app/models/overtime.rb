class Overtime < ActiveRecord::Base
  attr_accessible :description, :end_date, :end_time, :start_date, :start_time, :user_id, :project_id

  belongs_to :user, :inverse_of => :overtimes
  belongs_to :project




end
