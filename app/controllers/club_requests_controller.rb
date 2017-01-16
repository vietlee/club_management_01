class ClubRequestsController < ApplicationController
  def index
    @requests = current_user.club_requests
    if @request
      respond_to do |format|
        format.js
      end
    end
  end

  def new
    @request = ClubRequest.new
    @organizations = current_user.organizations
  end

  def create
    request = ClubRequest.new request_params
    if request.save
      flash[:success] = t("success_create")
    else
      flash_error request
    end
    redirect_to root_path
  end

  def destroy
    request = ClubRequest.find_by id: params[:id]
    if request
      @request_id = request.id
      if request.destroy
        respond_to do |format|
          format.js
        end
      end
    end
  end

  private
  def request_params
    params.require(:club_request).permit(:name, :logo,
      :description, :action, :organization_id).merge! user_id: current_user.id
  end
end
