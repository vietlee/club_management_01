class Manager::RequestsController < BaseOrganizationManagerController
  before_action :load_organization, only: [:index, :show]
  before_action :load_request, only: [:update, :show]

  def index
    @organization = Organization.find_by id: params[:organization]
    unless @organization
      flash[:danger] = t "not_found_organization"
      redirect_to request.referer
    end
    @requests = @organization.club_requests.pending.order_date_desc
  end

  def show
    @user = User.find_by id: @request.user_id
    unless @user
      flash[:danger] = t "not_found_user"
      redirect_to request.referer
    end
  end

  def update
    ActiveRecord::Base.transaction do
      if @request.update_attributes status: params[:status].to_i
        if params[:status].to_i == ClubRequest.statuses[:joined]
          create_club @request.organization_id, @request.name,
            @request.description, @request.member, @request.goal,
            @request.local, @request.content, @request.time_activity,
            @request.rules, @request.rule_finance, @request.time_join,
            @request.punishment, @request.plan, @request.logo,
            @request.club_type
          create_user_club @request.user_id, @club.id
          send_mail_club_request @request.user_id, @club
        end
        flash[:success] = t("success_process")
        redirect_to manager_organization_path(id: @request.organization_id)
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
      redirect_to request.referer
    end
  end

  def create_club organization_id, name, description, member, goal,
    local, content, time_activity, rules, rule_finance,
    time_join, punishment, plan, logo, club_type
    @club = Club.create organization_id: organization_id, name: name,
      description: description, member: member, goal: goal,
      local: local, content: content, time_activity: time_activity,
      rules: rules, rule_finance: rule_finance, time_join: time_join,
      punishment: punishment, plan: plan, logo: logo, is_active: true,
      club_type: club_type
  end

  def create_user_club user_id, club_id
    UserClub.create user_id: user_id, club_id: club_id, is_manager: true,
      status: :joined
  end

  def send_mail_club_request user_id, club
    @user = User.find_by id: user_id
    unless @user
      flash[:danger] = t("not_found_user")
      redirect_to root_url
    end
    OrganizationMailer.mail_to_club_request(@user, club).deliver_later
  end
end
