class StaticPagesController < ApplicationController
  def index
    @clubs = current_user.clubs if user_signed_in?
  end
end
