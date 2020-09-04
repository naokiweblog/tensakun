class Group < ApplicationRecord
  has_many :group_teachers
  has_many :teachers, through: :group_teachers, source: :teacher
  has_many :group_students
  has_many :students, through: :group_students, source: :student
  has_many :messages

  accepts_nested_attributes_for :group_teachers
  accepts_nested_attributes_for :group_students
end
