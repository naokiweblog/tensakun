class Message < ApplicationRecord
  belongs_to :teacher, optional: true
  belongs_to :student, optional: true
  belongs_to :group
  validates :content, presence: true, unless: :image?
  mount_uploader :image, MessageUploader
end
