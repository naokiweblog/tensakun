class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_teachers
  has_many :rooms, through: :room_teachers
  has_many :group_teachers
  has_many :groups, through: :group_teachers
  has_many :messages

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

  def self.guest
    find_or_create_by!(email: "teacher@example.com") do |teacher|
      teacher.name = "講師太郎"
      teacher.password = SecureRandom.urlsafe_base64
    end
  end
end
