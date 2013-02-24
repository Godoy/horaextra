class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :client
      t.references :user

      t.timestamps
    end
    add_index :projects, :client_id
    add_index :projects, :user_id
  end
end
