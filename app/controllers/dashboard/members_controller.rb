class Dashboard::MembersController < BaseDashboardController
  before_action :correct_manager
  before_action :load_member, only: :show
  before_action :load_correct_member, only: :show
  before_action :load_club, only: [:index, :show]

  def index
    unless @club
      flash[:danger] = t "cant_found_club"
      redirect_to dashboard_path
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
      redirect_to dashboard_club_members_path params[:club_id]
    end
  end

  def load_club
    @club = Club.find_by id: params[:club_id]
    unless @club
      flash[:danger] = t("cant_found_club")
      redirect_to dashboard_path
    end
  end
end
