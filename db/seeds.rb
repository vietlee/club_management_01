Organization.create!(
  name: "Framgia Da Nang",
  description: "bla bla",
  phone: "0966077747",
  email: "framgia@framgia.com",
  location: "Da Nang"
)
Organization.create!(
  name: "FPT Da Nang Branch",
  description: "bla bla",
  phone: "0966077747",
  email: "framgia2@framgia.com",
  location: "Da Nang"
)
Organization.create!(
  name: "Axon Da Nang",
  description: "bla bla",
  phone: "0966077747",
  email: "framgia3@framgia.com",
  location: "Da Nang"
)
Organization.create!(
  name: "Evolabe Asian",
  description: "bla bla",
  phone: "0966077747",
  email: "framgia4@framgia.com",
  location: "Da Nang"
)

User.create!(
  organization_id: 1,
  email: "mahoangtienthanh@gmail.com",
  full_name: "Thanh ManCi",
  password: "mahoangtienthanh@gmail.com",
  phone: "0966.077.747",
  role: 1
)
User.create!(
  organization_id: 1,
  email: "longlyduc@gmail.com",
  full_name: "Ly Duc Long",
  password: "longlyduc@gmail.com",
  phone: "0123456789",
  role: 1
)
