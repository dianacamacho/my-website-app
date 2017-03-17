class AddImagesToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :images, :json
    remove_column :projects, :image_1, :string
    remove_column :projects, :image_2, :string
    remove_column :projects, :image_3, :string
    remove_column :projects, :image_4, :string
  end
end
