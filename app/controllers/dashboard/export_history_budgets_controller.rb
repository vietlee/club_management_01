class Dashboard::ExportHistoryBudgetsController < BaseDashboardController
  before_action :load_club, only: :index
  def index
    @event_clubs = @club.events.without_notification(Settings.notification).newest
  end

  def create
  end

  private
  def load_club
    @club = Club.find_by id: params[:id]
    unless @club
      flash[:danger] = t "club_manager.cant_fount"
      redirect_to dashboard_path
    end
  end
end