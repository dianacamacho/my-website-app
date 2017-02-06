class AddShowDateToBlogPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :blog_posts, :show_date, :datetime
  end
end
