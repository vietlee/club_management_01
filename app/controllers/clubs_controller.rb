class ClubsController < ApplicationController
  before_action :load_club, only: [:show, :verify_club]
  before_action :verify_club, only: :show

  def index
    if request.fullpath == Settings.my_clubs
      @clubs = current_user.clubs.newest
      @organizations = current_user.user_organizations.joined
    else
      clubs_organizations = Club.of_organizations current_user.organizations
      @other_clubs = clubs_organizations.without_clubs(current_user.clubs).actives
    end
  end

  def show
    @events = @club.events.newest.page(params[:page]).per Settings.per_page
    @time_line_events = @events.by_current_year.group_by_quarter
    @messages = @club.messages
    @message = Message.new
  end

  def load_club
    @club = Club.find_by id: params[:id]
    unless @club
      flash[:danger] = t("not_found")
    end
  end

  def verify_club
    unless @club.is_active?
      flash[:danger] = t("club_is_lock")
      redirect_to clubs_url
    end
  end
end
