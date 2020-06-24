class RoomTeacher < ApplicationRecord
  belongs_to :room
  belongs_to :teacher
end
