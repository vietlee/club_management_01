class Manager::MembersController < BaseOrganizationManagerController
  def index
    @users = @organization.users
  end

  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t("not_found_user")
      redirect_to request.referrer
    end
    @organization = @user.organizations
  end
end
