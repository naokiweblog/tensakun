class CreateRoomTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_teachers do |t|
      t.references :room, foreign_key: true
      t.references :teacher, foreign_key: true
      t.timestamps
    end
  end
end
