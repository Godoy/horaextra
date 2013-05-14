class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.text :description
      t.date :day_off
      t.time :time_off
      t.references :user

      t.timestamps
    end
  end
end
