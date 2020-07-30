class Answer < ApplicationRecord
  belongs_to :room
  belongs_to :student

  validates :question, presence: true
  validates :content, presence: true
end
