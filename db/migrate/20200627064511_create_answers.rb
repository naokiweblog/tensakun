class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string  :question, null: false
      t.text    :content, null: false
      t.integer :score
      t.text    :hint
      t.references :room, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
