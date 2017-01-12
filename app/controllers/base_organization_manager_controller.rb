class BaseOrganizationManagerController < ApplicationController
  layout "manager_layout"

  before_action :user_signed_in
  before_action :admin_verify
  before_action :load_organizations
  before_action :load_organization, only: :index

  protected
  def admin_verify
    @admin = current_user.user_organizations.are_admin
    unless @admin.any?
      flash[:danger] = t "not_authorities_to_access"
      redirect_to root_path
    end
  end

  def load_organizations
    @organizations = current_user.organizations
  end

  def load_organization
    @organization = Organization.find_by id: params[:organization]
    unless @organization
      flash[:danger] = t("not_found_organization")
      redirect_to request.referrer
    end
  end
end
