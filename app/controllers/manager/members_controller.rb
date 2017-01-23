class Manager::MembersController < BaseOrganizationManagerController
  before_action :load_user_organization, only: :update

  def index
    @users = @organization.users
  end

  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t("not_found_user")
      redirect_to request.referrer
    end
    @organizations = @user.organizations
  end

  def update
    respond_to do |format|
      unless @user_organization.update_attributes status: UserOrganization.joined
        flash[:danger] = t "can_not_active"
      end
      format.js
    end
  end

  private
  def load_user_organization
    @user = UserOrganization.find_by id: params[:id]
    unless @user
      flash[:danger] = t("user_organization_not_found")
      redirect_to request.referrer
    end
  end
end
