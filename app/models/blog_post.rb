class BlogPost < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, ImageUploader
  validates :title, :text, presence: true

  def author
    "#{user.first_name} #{user.last_name}"
  end

  def friendly_created_at
    created_at.strftime("%B %d, %Y")
  end

  def published_on
    show_date.strftime("%B %d, %Y")
  end
end
