class CreateOvertimes < ActiveRecord::Migration
  def change
    create_table :overtimes do |t|
      t.text :description
      t.datetime :start_overtime
      t.datetime :end_overtime


      t.references :user
      t.references :project 

      t.timestamps
    end
  end
end
