class CreateOvertimes < ActiveRecord::Migration
  def change
    create_table :overtimes do |t|
      t.text :description
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date

      t.references :user
      t.references :project

      t.timestamps
    end
  end
end
