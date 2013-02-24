class Overtime < ActiveRecord::Base
  attr_accessible :description, :end_date, :end_time, :start_date, :start_time, :user_id

  belongs_to :user, :inverse_of => :overtimes


  #rails_admin do
  #  configure :user do
      # configuration here
  #  end
  #end


end
