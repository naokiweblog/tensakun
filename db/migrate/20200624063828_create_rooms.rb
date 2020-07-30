class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null:false
      t.index :name, unique: true
      t.references :teacher, foreign_key: true
      t.timestamps
    end
  end
end
