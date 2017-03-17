class Project < ApplicationRecord
  has_and_belongs_to_many :technologies, dependent: :destroy
  belongs_to :user
  mount_uploaders :images, ProjectImageUploader
  validates :name, :type, :description, presence: true

  def author
    "#{user.first_name} #{user.last_name}"
  end

  def friendly_created_at
    created_at.strftime("%B %d, %Y")
  end
end
