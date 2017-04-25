class Admin::FeedBacksController < ApplicationController
  layout "admin_layout"
  before_action :admin_signed_in

  def index
    @feed_backs = FeedBack.newest
  end
end
