class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_organization, only: :show

  def index
    @q = Organization.search(params[:q])
    @organizations = @q.result.newest.page(params[:page]).per Settings.club_per_page
  end

  def show
    @user_organization = current_user.user_organizations
      .find_by organization_id: @organization.id
  end

  private
  def load_organization
    @organization = Organization.find_by id: params[:id]
    return if @organization
    flash[:danger] = t("organization_not_found")
    redirect_to root_url
  end
end
