class ActivitiesController < ApplicationController
  before_action :load_activity, only: :create

  def create
    @activity.readed!
  end

  private
  def load_activity
    @activity = Activity.find_by id: params[:id]
    return if @activity
    flash[:danger] = t("not_foud_activity")
    redirect_to root_url
  end
end
