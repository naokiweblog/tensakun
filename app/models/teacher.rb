class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_teachers
  has_many :rooms, through: :room_teachers

  validates :name, presence: true, uniqueness: true
end
