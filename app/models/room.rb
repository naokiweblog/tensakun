class Room < ApplicationRecord
  has_many :room_teachers
  has_many :teachers, through: :room_teachers
  has_many :room_students
  has_many :students, through: :room_students
  validates :name, presence: true, uniqueness: true
end
