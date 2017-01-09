class Admin::StaticPagesController < ApplicationController
  layout "admin_layout"
  before_action :admin_signed_in

  def index
  end
end
