class UserEventsController < ApplicationController
  before_action :load_event, only: :create

  def create
    user_event = UserEvent.new user_event_params
    unless user_event.save
      flash_error user_event
      redirect_to :back
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    user_event = current_user.user_events.find_by event_id: params[:event_id]
    if user_event
      @event = user_event.event
      unless user_event.destroy
        flash_error user_event
        redirect_to :back
      end
    else
      flash[:danger] = t("not_found_user_event")
      redirect_to :back
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def user_event_params
    params.require(:user_event).permit(:event_id).merge! user_id: current_user.id
  end

  def load_event
    @event = Event.find_by id: params[:user_event][:event_id]
    unless @event
      flash[:danger] = t("not_found_event")
      redirect_to :back
    end
  end
end
