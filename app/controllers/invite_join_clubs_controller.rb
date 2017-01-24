class InviteJoinClubsController < ApplicationController
  before_action :load_club, :load_user

  def create
  end

  private
  def joined_club?
    UserClub.find_with_user_of_club(params[:user_id], params[:club_id]).present?
  end

  def joined_organization?
    @user.organizations.find_by(id: @club.organization.id).present?
  end

  def load_club
    @club = Club.find_by id: params[:club_id]
    return if @club
    flash[:danger] = t("not_found_club")
    redirect_to root_url
  end

  def load_user
    @user = User.find_by id: params[:user_id]
    return if @user
    flash[:danger] = t("not_found_user")
    redirect_to root_url
  end
end
