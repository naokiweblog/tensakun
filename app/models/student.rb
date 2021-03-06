class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :answers
  has_many :room_students
  has_many :rooms, through: :room_students
  has_many :group_students
  has_many :groups, through: :group_students
  has_many :messages

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  def self.guest
    find_or_create_by!(email: "student@example.com") do |student|
      student.name = "生徒太郎"
      student.password = SecureRandom.urlsafe_base64
    end
  end
end
