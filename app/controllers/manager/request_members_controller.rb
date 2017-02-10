class Manager::RequestMembersController < BaseOrganizationManagerController
  def index
    @users = @organization.user_organizations.pending
  end
end
