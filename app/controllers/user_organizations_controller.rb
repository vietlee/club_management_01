class UserOrganizationsController < ApplicationController
  before_action :load_organization, only: :show

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
    redirect_to user_user_organizations_path
  end

  private
  def load_organization
    @organization = Organization.find_by id: params[:id]
    unless @organization
      flash[:danger] = t("organization_not_found")
      redirect_to :back
    end
  end

  def organization_params
    params.permit(:organization_id).merge! user_id: current_user.id
  end
end
