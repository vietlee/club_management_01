class ClubManager::UserClubsController < BaseClubManagerController
  before_action :load_userclub, only: :update

  def index
    @club = Club.find_by id: params[:club_id]
    unless @club
      flash[:danger] = t "cant_found_club"
      redirect_to club_manager_path
    end
    @user_clubs = @club.user_clubs.unactive
  end

  def update
    if @user_club.joined!
      flash[:success] = t "club_manager.user_club.success_update"
    else
      flash_error @club
    end
    redirect_to :back
  end

  private
  def load_userclub
    @user_club = UserClub.find_by id: params[:id]
    unless @user_club
      flash[:danger] = t "cant_found_request"
      redirect_to club_manager_path
    end
  end
end
