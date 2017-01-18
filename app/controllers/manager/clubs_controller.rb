class Manager::ClubsController < BaseOrganizationManagerController
  before_action :load_club, only: :show

  def index
    @clubs = @organization.clubs.newest
  end

  def show
    @users = @club.users
  end

  private
  def load_club
    @club = Club.find_by id: params[:id]
    unless @club
      flash[:danger] = t("not_found_club")
      redirect_to request.referrer
    end
    @organization = @club.organization
  end
end
