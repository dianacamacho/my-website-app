class AddDraftToBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :draft, :boolean, default: false
  end
end
