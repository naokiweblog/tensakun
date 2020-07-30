class CreateRoomStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :room_students do |t|
      t.references :room, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
