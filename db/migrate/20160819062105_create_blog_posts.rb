class CreateBlogPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_posts do |t|
      t.integer :user_id
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
