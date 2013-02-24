class Overtime < ActiveRecord::Base
  attr_accessible :description, :end_date, :end_time, :start_date, :start_time

  belongs_to :user
end
