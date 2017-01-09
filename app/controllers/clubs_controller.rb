class ClubsController < ApplicationController
  before_action :load_club, only: :show

  def index
  end

  def show
    @events = @club.events.newest.page(params[:page]).per Settings.per_page
  end

  def load_club
    @club = Club.find_by id: params[:id]
    unless @club
      flash[:danger] = t("not_found")
    end
  end
end
