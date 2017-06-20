class StaticPagesController < ApplicationController
  before_action :check_login

  def index
    @clubs = current_user.clubs if user_signed_in?
  end

  private
  def check_login
    if user_signed_in?
      redirect_to my_clubs_path
    end
  end
end
