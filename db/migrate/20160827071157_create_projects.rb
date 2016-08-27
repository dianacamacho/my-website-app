class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :github
      t.string :website
      t.string :screencast
      t.string :preview
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4

      t.timestamps
    end
  end
end
