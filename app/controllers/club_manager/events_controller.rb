class ClubManager::EventsController < BaseClubManagerController
  before_action :load_club, only: [:index, :show, :create]
  before_action :load_event, only: [:show, :edit, :update]

  def index
    unless @club
      flash[:danger] = t "cant_found_club"
      redirect_to club_manager_path
    end
    @events = @club.events.newest.page(params[:page]).per Settings.per_page_event
  end

  def create
    event = Event.new event_params
    if event.save
      create_acivity event, current_user, Settings.create
      flash[:success] = t "club_manager.event.success_create"
      redirect_to club_manager_club_path params[:club_id]
    else
      flash_error event
      redirect_to :back
    end
  end

  def show
    @news = News.new
  end

  private
  def load_event
    @event = Event.find_by id: params[:id]
    unless @event
      flash[:danger] = t "club_manager.event.not_found"
      redirect_to :back
    end
  end

  def load_club
    @club = Club.find_by id: params[:club_id]
    unless @club
      flash[:danger] = t "club_manager.club.not_found"
      redirect_to club_manager_club_albums_path params[:club_id]
    end
  end

  def event_params
    params.require(:event).permit :club_id, :name, :date_start,
      :expense, :date_end, :location, :description, :image
  end
end
