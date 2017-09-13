class BudgetsController < ApplicationController
  before_action :load_club

  def index
    @event_clubs = @club.events.without_notification(Settings.notification).newest
    @events = @event_clubs.by_created_at params[:date_search][:first_date],
      params[:date_search][:second_date]
    if @events
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def load_club
    @club = Club.find_by id: params["club_id"]
    unless @club
      flash[:danger] = t "cant_found_club"
      redirect_to root_path
    end
  end
end
