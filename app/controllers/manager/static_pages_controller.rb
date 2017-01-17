class Manager::StaticPagesController < ApplicationController
  layout "manager_layout"

  before_action :user_signed_in

  def index
    @organizations = current_user.organizations
  end
end
