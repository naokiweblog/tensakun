FactoryBot.define do

  factory :message do
    content    {"メッセージ"}
    image      {File.open("#{Rails.root}/public/images/test_image.png")}
    group
    teacher
    student
  end

end