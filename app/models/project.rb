class Project < ApplicationRecord
  has_and_belongs_to_many :technologies, dependent: :destroy
  belongs_to :user

  validates :name, :description, :image_1, presence: true

  def author
    "#{user.first_name} #{user.last_name}"
  end

  def friendly_created_at
    created_at.strftime("%B %d, %Y")
  end

  def images
    project_images = [image_1, image_2, image_3, image_4]
    project_images.reject { |photo| photo == "" || photo == nil }
  end
end
