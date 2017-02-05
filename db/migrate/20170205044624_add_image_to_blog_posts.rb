class AddImageToBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :images, :json
  end
end
