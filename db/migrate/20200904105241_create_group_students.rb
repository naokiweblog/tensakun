class CreateGroupStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :group_students do |t|
      t.references :group, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
