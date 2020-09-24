FactoryBot.define do

  factory :answer do
    question              {"1-1"}
    content               {"私はりんごを食べた。"}
    score                 {1}
    hint                  {"食べたのはりんごだけかな。"}
    room_id               {1}
    student_id            {1}

    association :room
    association :student
  end

end