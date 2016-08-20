class BlogPost < ApplicationRecord
  validates :title, :text, presence: true
end
