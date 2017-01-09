class ClubRequestsController < ApplicationController
  def new
    @request = ClubRequest.new
  end

  def create
    request = ClubRequest.new request_params
    if request.save
      # ApplicationMailer.sent_request_club.deliver
      flash[:success] = t("success_create")
    else
      flash_error request
    end
    redirect_to root_path
  end

  private
  def request_params
    params.require(:club_request).permit(:name, :logo,
      :description, :action).merge! user_id: current_user.id,
      organization_id: current_user.organization_id
  end
end
