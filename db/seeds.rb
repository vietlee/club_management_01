Organization.create!(
  name: "Framgia Da Nang",
  description: Faker::Lorem.paragraph,
  phone: "0966077747",
  email: "framgia@framgia.com",
  location: "Da Nang"
)
Organization.create!(
  name: "FPT Da Nang Branch",
  description: Faker::Lorem.paragraph,
  phone: "0966077747",
  email: "framgia2@framgia.com",
  location: "Da Nang"
)
User.create!(
  email: "quocvietlee@gmail.com",
  full_name: "Quoc Viet",
  password: "quocvietlee@gmail.com",
  phone: "01689020813",
)
Admin.create!(
  email: "quocvietlee@gmail.com",
  full_name: "Quoc Viet",
  password: "quocvietlee@gmail.com",
  phone: "01689020813",
)
50.times do |n|
  organization_id = 1
  club_name  = Faker::Name.name
  notification = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph
  created_at = Faker::Time.between(20.days.ago, Date.today, :all)
  logo = Faker::Avatar.image
  image = Faker::Avatar.image
  Club.create!(
    organization_id: organization_id,
    name: club_name + " Club",
    notification: notification,
    description: description,
    created_at: created_at,
    logo: logo,
    rating: rand(1..5),
    image: image,
    is_active: true)
end
users = User.order(:created_at).take(2)
clubs = Club.order(:created_at).take(15)
clubs.each do |club|
  users.each do |user|
    UserClub.create!(
      club_id: club.id,
      user_id: user.id,
      is_manager: true
    )
  end
end

clubs = Club.all
clubs.each do |club|
  15.times do |n|
    event_name = Faker::Lorem.sentence
    description = Faker::Lorem.paragraph
    expense = Faker::Number.number(5)
    club_id = club.id
    event_category = rand(1..3)
    date_start = Faker::Time.between(20.days.ago, Date.today, :all)
    date_end = Faker::Time.between(20.days.ago, Date.today, :all)
    location = Faker::Address.city
    num_like = rand(0..100)
    created_at = Time.now + 2.month

    Event.create!(
      name: event_name,
      description: description,
      expense: expense,
      club_id: club_id,
      event_category: rand(1..3),
      date_start: date_start,
      date_end: date_end,
      location: location,
      num_like: num_like,
      created_at: created_at,
      user_id: rand(1..2)
    )
  end
end

UserOrganization.create!(
  user_id: 1,
  organization_id: 1,
  status: 1
  is_admin: 1
)
