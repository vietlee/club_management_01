class Manager::StaticPagesController < ApplicationController
  layout "manager_layout"

  def index
    @organizations = current_user.organizations
  end
end
