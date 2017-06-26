FactoryGirl.define do
  factory :club_request do
    name{Faker::Name.name}
    content{Faker::Lorem.sentence}
    goal{Faker::Lorem.sentence}
    member{Faker::Number.number(5)}
  end
end
