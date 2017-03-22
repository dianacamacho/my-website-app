class BlogPost < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, ImageUploader
  validates :title, :text, presence: true
  scope :published, -> { where('show_date <= ? AND draft = ?', Time.zone.now, false) }
  scope :upcoming, -> { where('show_date > ? AND draft = ?', Time.zone.now, false) }
  scope :drafts, -> { where('draft = ?', true) }

  def author
    "#{user.first_name} #{user.last_name}"
  end

  def friendly_created_at
    created_at.strftime("%B %d, %Y")
  end

  def published_on
    show_date.strftime("%B %d, %Y")
  end

  def shortened_text
    link = "/blog_posts/#{id}"
    text[0..259] + " ... " + '<a href=' + link + ' class="blue-text">View Full Post</a>'
  end

  def viewable?
    draft || (show_date > Time.zone.now) ? false : true 
  end
end
