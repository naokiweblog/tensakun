class Group < ApplicationRecord
  has_many :group_teachers
  has_many :teachers, through: :group_teachers, source: :teacher
  has_many :group_students
  has_many :students, through: :group_students, source: :student
  has_many :messages

  accepts_nested_attributes_for :group_teachers
  accepts_nested_attributes_for :group_students


  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        "画像が投稿されています"
      end
    else
      "まだメッセージはありません。"
    end
  end
end
