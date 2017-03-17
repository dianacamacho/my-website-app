class Project < ApplicationRecord
  has_and_belongs_to_many :technologies, dependent: :destroy
  belongs_to :user
  mount_uploaders :images, ProjectImageUploader
  validates :name, :project_type, :description, presence: true

  def author
    "#{user.first_name} #{user.last_name}"
  end

  def friendly_created_at
    created_at.strftime("%B %d, %Y")
  end

  def main_image
    if images.any?
      image_link = images.select {|image| image.url.include?("header_image")}.first.show.url
    end
  end

  def index_image
    if images.any?
      image_link = images.select {|image| image.url.include?("header_image")}.first.index.url
    end
  end
end
