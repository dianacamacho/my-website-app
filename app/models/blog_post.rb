class BlogPost < ApplicationRecord
  belongs_to :user
  validates :title, :text, presence: true

  def author
    "#{user.first_name} #{user.last_name}"
  end

  def friendly_created_at
    created_at.strftime("%B %d, %Y")
  end
end
