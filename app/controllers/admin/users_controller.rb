class Admin::UsersController < ApplicationController
  layout "admin_layout"
  before_action :admin_signed_in
  before_action :load_user, except: :index

  def index
    @users = User.newest
  end

  def show
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t("can_not_found_user")
      redirect_to admin_users_path
    end
  end
end
