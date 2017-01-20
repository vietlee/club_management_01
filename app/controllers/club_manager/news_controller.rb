class ClubManager::NewsController < BaseClubManagerController
  before_action :load_club
  before_action :load_event
  before_action :load_news, only: [:show, :update, :edit]

  def create
    news = News.new news_params
    if news.save
      flash[:success] = t "club_manager.news.success_create"
    else
      flash_error news
    end
    redirect_to club_manager_club_event_path id: params[:event_id]
  end

  def new
    @news = News.new
  end

  def edit
  end

  def update
    if @news.update_attributes news_params
      flash[:success] = t "club_manager.news.success_update"
      redirect_to club_manager_club_event_news_path
    else
      flash_error @news
      redirect_to :back
    end
  end

  def show
  end

  private
  def news_params
    params.require(:news).permit(:title, :content,
      :image).merge! user_id: current_user.id, event_id: @event.id
  end

  def load_news
    @news = News.find_by id: params[:id]
    unless @news
      flash[:danger] = t "cant_found_news"
      redirect_to club_manager_club_event_path @event.club_id, @event
    end
  end

  def load_event
    @event = Event.find_by id: params[:event_id]
    unless @event
      flash[:danger] = t "club_manager.event.not_found"
      redirect_to :back
    end
  end

  def load_club
    @club = Club.find_by id: params[:club_id]
    unless @club
      flash[:danger] = t "club_manager.club.not_found"
      redirect_to :back
    end
  end
end
