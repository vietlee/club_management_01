class ClubsController < ApplicationController
  before_action :load_club, only: :show

  def index
  end

  def show
    @events_top = @club.events.order_like.order_created_at.limit(10)
  end

  def load_club
    @club = Club.find_by id: params[:id]
    unless @club
      flash[:danger] = t("not_found")
    end
  end
end
