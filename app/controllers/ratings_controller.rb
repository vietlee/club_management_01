class RatingsController < ApplicationController
  before_action :load_club, only: [:create, :rating_executed]

  def create
    unless @club.ratings.find_by(user: current_user)
      ActiveRecord::Base.transaction do
        @club.ratings.build(user: current_user, star: params[:rating]).save
        rating_executed
        create_acivity @club, Settings.ratings, @club.organization, current_user
        respond_to do |format|
          format.js
        end
      end
    else
      flash[:danger] = t("you_rated")
      redirect_to :back
    end
  end

  private
  def rating_executed
    unless @club.update_columns rating: Rating.avg_rate(params[:rating], @club)
      flash[:danger] = t("not_rating")
      redirect_to root_url
    end
  end

  def rating_params
    params.permit :rating, :book_id
  end

  def load_club
    @club = Club.find_by id: params[:club_id]
    unless @club
      flash[:danger] = t("not_found_club")
      redirect_to root_url
    end
  end
end
