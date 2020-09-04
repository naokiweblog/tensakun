class GroupTeacher < ApplicationRecord
  belongs_to :group
  belongs_to :teacher
end
