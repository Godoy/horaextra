class ProjectsUsers < ActiveRecord::Migration
  def up
  	create_table :projects_users do |t|
      t.references :project
      t.references :user

    end
    add_index :projects_users, :project_id
    add_index :projects_users, :user_id
  end

  def down
  end
end
