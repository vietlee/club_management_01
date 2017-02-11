class ClubManager::ClubBudgetsController < BaseClubManagerController
  before_action :load_club, only: :create
  def index
    @event = Event.new
    @clubs = Club.of_user_clubs(current_user.user_clubs.manager)
  end

  def new
  end

  def create
    @users = @club.users
    respond_to do |format|
      format.js
    end
  end

  private
  def load_club
    @club = Club.find_by id: params[:club_id]
    return if @club
    flash[:danger] = t("not_found_club")
    redirect_to club_manager_club_budgets_url
  end
end
