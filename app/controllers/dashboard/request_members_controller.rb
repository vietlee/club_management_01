class Dashboard::RequestMembersController < BaseDashboardController
  def index
    @users = @organization.user_organizations.pending
  end
end
