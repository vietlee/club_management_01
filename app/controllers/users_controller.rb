class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, only: :show
  before_action :load_organizations, only: [:show, :edit]

  def show
    @clubs = Club.of_user_clubs(@user.user_clubs.joined)
    @club_time_lines = current_user.clubs
  end

  def edit
    @user = current_user
    return if current_user
    flash[:danger] = t("user_not_found")
    redirect_to root_url
  end

  def update
    if current_user.update user_params
      flash[:success] = t("update_user_success")
      bypass_sign_in(current_user)
      redirect_to user_url(current_user)
    else
      flash_error current_user
      redirect_to :back
    end
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t("user_not_found")
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit :full_name, :email, :phone, :avatar,
      :password, :password_confirmation
  end

  def load_organizations
    @organizaitons = Organization.by_user_organizations(
      @user.user_organizations.joined)
  end
end
