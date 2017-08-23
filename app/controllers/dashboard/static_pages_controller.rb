class Dashboard::StaticPagesController < BaseDashboardController
  layout "dashboard_layout"

  def index
    @organizations = current_user.user_organizations.are_admin
    @managers = current_user.user_clubs.manager
  end
end
