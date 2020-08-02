class Answer < ApplicationRecord
  belongs_to :room
  belongs_to :student

  validates :question, presence: true, length: { maximum: 6 }
  validates :content, presence: true
end
