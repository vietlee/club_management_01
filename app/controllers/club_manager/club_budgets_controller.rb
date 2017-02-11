class ClubManager::ClubBudgetsController < ApplicationController
  before_action :load_club, :load_event, only: :create

  def create
    if @event
      @users = @club.users.payment_not_yet(@event.budgets)
    else
      @users = @club.users
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def load_event
    @event = @club.events.of_category(4).find_by month_of_payment:
      params[:month_of_payment]
    return if @event
    flash[:danger] = t("event.not_found")
  end
end
