class OrganizationsController < ApplicationController
  before_action :load_organization, only: :show

  def show
  end

  private
  def load_organization
    @organization = Organization.find_by id: params[:id]
    return if @organization
    flash[:danger] = t("organization_not_found")
    redirect_to :back
  end
end
