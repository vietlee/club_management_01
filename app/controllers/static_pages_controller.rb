class StaticPagesController < ApplicationController
  before_action :check_login

  def index
    @clubs = current_user.clubs if user_signed_in?
  end

  private
  def check_login
    redirect_to my_clubs_path if user_signed_in?
  end
end
