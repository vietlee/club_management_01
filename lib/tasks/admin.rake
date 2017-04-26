namespace :db do
  desc "Seeding data"
  task init_admin: :environment do
    puts "Create admin"
    Admin.create!(
      email: "admin.club@gmail.com",
      full_name: "Admin Club",
      password: "12345678"
    )
  end
end
