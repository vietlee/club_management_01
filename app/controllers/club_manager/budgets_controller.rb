class ClubManager::BudgetsController < BaseClubManagerController
  before_action :load_club, only: :create
  def index
    @clubs = Club.of_user_clubs(current_user.user_clubs.manager)
  end

  def create
    ActiveRecord::Base.transaction do
      create_event
      params[:user_ids].split(",").each do |user_id|
        budget = Budget.create! budget_params user_id
      end
      @event.cost_expense(params[:user_ids].split(",").size)
    end
    redirect_to club_manager_club_url(@club)
  end

  private
  def create_event
    event_category = EventCategory.find_by id: Settings.periodic_category
    @event = event_category.events.of_month_payment(
      params[:month_of_payment].first).find_by club_id: params[:club_id]
    flash[:info] = t("amount_event")
    return if @event
    @event = @club.events.build event_params
    if @event.save
      flash[:success] = t("event.success_create")
    else
      flash_error @event
    end
  end

  def budget_params user_id
    params.permit().merge! user_id: user_id, event_id: @event.id
  end

  def event_params
    params.permit(:amount).merge! user_id: current_user.id,
      name: Settings.payment_budget + params[:month_of_payment].first,
      location: @club.organization.location, description: params[:description].first,
      date_start: (params[:month_of_payment].first.to_datetime).at_beginning_of_month,
      date_end: (params[:month_of_payment].first.to_datetime).end_of_month,
      month_of_payment: params[:month_of_payment].first,
      event_category_id: Settings.periodic_category
  end
end
