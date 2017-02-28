class Manager::OrganizationsController < BaseOrganizationManagerController
  before_action :load_organization, only: [:show, :edit, :update]

  def show
    @members = @organization.user_organizations.includes(:user)
    @requests = @organization.club_requests.pending.order_date_desc
    @clubs = @organization.clubs.newest
  end

  def edit
  end

  def update
    if @organization.update_attributes organization_parmas
      flash[:success] = t("update_organization_success")
      redirect_to manager_organization_path(id: @organization.id)
    else
      flash[:danger] = t "error_update"
      render :edit
    end
  end

  private
  def load_organization
    @organization = Organization.find_by id: params[:id]
    unless @organization
      flash[:danger] = t("organization_not_found")
      redirect_to request.referrer
    end
  end

  def organization_parmas
    params.require(:organization).permit :name, :description, :phone,
      :email, :location, :logo
  end
end
