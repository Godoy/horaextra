class AddStatusToOvertime < ActiveRecord::Migration
  def change
   
    add_column :overtimes, :status, :string, :default => "pedding"
  
  end
end
