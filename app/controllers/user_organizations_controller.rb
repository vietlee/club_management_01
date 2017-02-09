class UserOrganizationsController < ApplicationController
  before_action :load_organization, only: [:show, :destroy]

  def index
    @organizations = Organization.page(params[:page]).per(Settings.organization_per_page)
  end

  def show
    respond_to do |format|
      format.js
    end
  end

  def create
    user_organization = UserOrganization.new organization_params
    if user_organization.save
      flash[:success] = t("success_create_user_organization")
    else
      flash[:danger] = t("cant_create_user_organization")
    end
    redirect_to :back
  end

  def destroy
    user_organization = @organization.user_organizations
    .find_by user_id: current_user.id
    if user_organization.destroy
      flash[:success] = t("cancel_success")
    else
      flash[:danger] = t("cancel_error")
    end
    redirect_to organization_path(@organization)
  end

  private
  def load_organization
    @organization = Organization.find_by id: params[:id]
    return if @organization
    flash[:danger] = t("organization_not_found")
    redirect_to :back
  end

  def organization_params
    params.require(:user_organization).permit(:organization_id).merge! user_id: current_user.id
  end
end
