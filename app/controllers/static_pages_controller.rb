class StaticPagesController < ApplicationController
  before_action :user_signed_in, only: :index

  def index
    @clubs = current_user.clubs
  end
end
