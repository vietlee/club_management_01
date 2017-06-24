FactoryGirl.define do
  factory :club_request do
    name{Faker::Name.name}
    description{Faker::Lorem.sentence}
  end
end
