class AddProjectTypeToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :project_type, :string
    add_column :projects, :client, :string
  end
end
