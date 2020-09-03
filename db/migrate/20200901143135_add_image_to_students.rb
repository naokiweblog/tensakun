class AddImageToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :image, :string
  end
end
