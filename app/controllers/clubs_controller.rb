class ClubsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_club, only: [:show, :verify_club]
  before_action :verify_club, only: :show

  def index
    @club_joined = Club.of_organizations(
      current_user.organizations).of_user_clubs(current_user.user_clubs.joined)
    clubs = Club.of_organizations(current_user.organizations).without_clubs(
      @club_joined)
    @q = clubs.search(params[:q])
    @clubs = @q.result.newest.page(params[:page]).per Settings.club_per_page
  end

  def show
    events = @club.events
    @q = events.search(params[:q])
    @events = @q.result.newest.page(params[:page]).per Settings.per_page
    @time_line_events = @events.by_current_year.group_by_quarter
    @messages = @club.messages
    @message = Message.new
    @user_club = UserClub.new
    @members = @club.user_clubs.joined
  end

  protected
  def verify_club
    unless @club.is_active?
      flash[:danger] = t("club_is_lock")
      redirect_to clubs_url
    end
  end

  def load_club
    @club = Club.find_by id: params[:id]
    return if @club
    flash[:danger] = t("not_found")
  end
end
