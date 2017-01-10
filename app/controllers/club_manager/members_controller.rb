class ClubManager::MembersController < BaseClubManagerController
  before_action :correct_manager
  before_action :load_member, only: :show
  before_action :load_correct_member, only: :show

  def index
    @club = Club.find_by id: params[:club_id]
    unless @club
      flash[:danger] = t "cant_found_club"
      redirect_to club_manager_path
    end
    @members = @club.users
  end

  def show
  end

  private
  def load_member
    @member = User.find_by id: params[:id]
    unless @member
      flash[:danger] = t("user.cant_found")
      redirect_to club_manager_club_members_path params[:club_id]
    end
  end
end
