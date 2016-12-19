class OrganizationsController < ApplicationController
  before_action :user_signed_in
  before_action :load_organization

  def show
  end
end
