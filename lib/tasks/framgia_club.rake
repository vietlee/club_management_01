namespace :db do
  desc "Seeding data"
  task seeding: :environment do
    %w[db:drop db:create db:migrate db:seed].each do |task|
      Rake::Task[task].invoke
    end

    framgiadn = Organization.create!(
      name: "Framgia Da Nang",
      description: "Chi nhánh Framgia tại Đà Nẵng",
      phone: "0966077747",
      email: "framgiadn@framgia.com",
      location: "Da Nang"
    )
    framgiahn = Organization.create!(
      name: "Framgia Ha Noi",
      description: "Chi nhánh Framgia tại Hà Nội",
      phone: "0966077747",
      email: "framgiahn@framgia.com",
      location: "Ha Noi"
    )
    User.create!(
      email: "quocvietlee@gmail.com",
      full_name: "Quoc Viet",
      password: "quocvietlee@gmail.com",
      phone: "01689020813",
    )
    Admin.create!(
      email: "fclub.framgia.info@gmail.com",
      full_name: "Admin",
      password: "fclub.framgia.info@gmail.com",
      phone: "0966077747",
    )
    bongda_club = Club.create!(
      name: "CLB Bóng đá",
      is_active: 1,
      club_type: 1,
      organization_id: 1,
      description: "Câu lạc bộ bóng đá tại FramGia Đà Nẵng",
      money: 2240000
    )
    tuthien_club = Club.create!(
      name: "CLB CLB Từ Thiện",
      is_active: 1,
      club_type: 0,
      organization_id: 1,
      description: "Câu lạc bộ từ thiện tại FramGia Đà Nẵng",
      money: 1150000
    )
    game_club = Club.create!(
      name: "CLB Game",
      is_active: 1,
      club_type: 2,
      organization_id: 1,
      description: "Câu lạc bộ game tại FramGia Đà Nẵng",
      money: 1150000
    )
    tiengnhat_club = Club.create!(
      name: "CLB Tiếng Nhật",
      is_active: 1,
      club_type: 1,
      organization_id: 1,
      description: "Câu lạc bộ tiếng nhật tại FramGia Đà Nẵng",
      money: 250000
    )
    UserOrganization.create!(
      user_id: 1,
      organization_id: framgiadn.id,
      status: 1,
      is_admin: 1
    )
    UserOrganization.create!(
      user_id: 1,
      organization_id: framgiahn.id,
      status: 1,
      is_admin: 1
    )
    UserClub.create!(
      user_id: 1,
      club_id: bongda_club.id,
      status: 1,
      is_manager: 1
    )
    UserClub.create!(
      user_id: 1,
      club_id: tuthien_club.id,
      status: 1,
      is_manager: 1
    )
    UserClub.create!(
      user_id: 1,
      club_id: game_club.id,
      status: 1,
      is_manager: 1
    )
    UserClub.create!(
      user_id: 1,
      club_id: tiengnhat_club.id,
      status: 1,
      is_manager: 1
    )

  end
end
