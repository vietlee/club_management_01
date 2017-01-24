class Manager::RequestsController < BaseOrganizationManagerController
  before_action :load_organization, only: [:index, :show]
  before_action :load_request, only: [:update, :show]

  def index
    @organization = Organization.find_by id: params[:organization]
    unless @organization
      flash[:danger] = t "not_found_organization"
      redirect_to request.referrer
    end
    @requests = @organization.club_requests.order_date_desc
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
      unless @request.update_attributes approve: ClubRequest.joined
        flash[:danger] = t "can_not_approve"
        redirect_to request.referrer
      end
      create_club @request.organization_id, @request.name, @request.description,
        @request.logo
      create_user_club @request.user_id, @club.id
    end
    flash[:success] = t "aprroved_success"
    redirect_to request.referrer
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
