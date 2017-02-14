class Manager::RequestsController < BaseOrganizationManagerController
  before_action :load_organization, only: [:index, :show]
  before_action :load_request, only: [:update, :show]

  def index
    @organization = Organization.find_by id: params[:organization]
    unless @organization
      flash[:danger] = t "not_found_organization"
      redirect_to request.referrer
    end
    @requests = @organization.club_requests.pending.order_date_desc
  end

  def show
    @user = User.find_by id: @request.user_id
    unless @user
      flash[:danger] = t "not_found_user"
      redirect_to request.referrer
    end
  end

  def update
    ActiveRecord::Base.transaction do
      if @request.update_attributes status: params[:status].to_i
        if params[:status].to_i == ClubRequest.statuses[:joined]
          create_club @request.organization_id, @request.name,
            @request.description, @request.logo
          create_user_club @request.user_id, @club.id
        end
        flash[:success] = t("success_process")
        redirect_to manager_requests_path(organization: params[:organization])
      else
        flash[:danger] = t("error_process")
        redirect_to :back
      end
    end
    rescue
      flash[:danger] = t("cant_not_update")
      redirect_to :back
  end

  private
  def load_organization
    @organizations = current_user.organizations
  end

  def load_request
    @request = ClubRequest.find_by id: params[:id]
    unless @request
      flash[:danger] = t "not_found_request"
      redirect_to request.referrer
    end
  end

  def create_club organization_id, name, description, logo
    @club = Club.create organization_id: organization_id, name: name,
      description: description, logo: logo, is_active: true
  end

  def create_user_club user_id, club_id
    UserClub.create user_id: user_id, club_id: club_id, is_manager: true,
      status: :joined
  end
end
