class RemoveTeacherFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_reference :rooms, :teacher, null: false, foreign_key: true
  end
end
