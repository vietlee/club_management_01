class UserClubsController < ApplicationController
  before_action :load_user_club, only: :destroy

  def create
    user_club = UserClub.new request_params
    if user_club.save
      flash[:success] = t("success_for_join")
    else
      flash[:danger] = t("error_for_join")
    end
    @club = user_club.club
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @club = @user_club.club
    if @user_club.destroy
      flash[:success] = t("cancel_success")
    else
      flash_error @user_club
    end
    @user_club = UserClub.new
    respond_to do |format|
      format.js
    end
  end

  private
  def request_params
    params.require(:user_club).permit(:club_id).merge! user_id: current_user.id
  end

  def load_user_club
    @user_club = current_user.user_clubs.find_by club_id: params[:club_id]
    unless @user_club
      flash[:danger] = t("not_found_user_club")
      redirect_to :back
    end
  end
end
