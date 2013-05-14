class Discount < ActiveRecord::Base
  attr_accessible :day_off, :description, :time_off, :user_id

  belongs_to :user

  def self.diff(current_user)
  	datetimeJan2000BeginOfTimes = 946684800

  	total = 0
  	current_user.discount.all.each do | discount |
  		total += (discount.time_off.to_i - datetimeJan2000BeginOfTimes )
  	end
  	total
  end
 
end
