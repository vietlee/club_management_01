class ClubManager::ClubsController < BaseClubManagerController
  before_action :load_club
  before_action :manager_club
  before_action :load_organization, only: :show

  def show
    @event = Event.new
    @new_album = Album.new
    @support = Support::ClubSupport.new(@club, params[:page], @organization)
  end

  def update
    if @club.update_attributes club_params
      create_acivity @club, Settings.update, @club, current_user
      flash[:success] = t "club_manager.club.success_update"
    else
      flash_error @club
    end
    redirect_to :back
  end

  private
  def club_params
    params.require(:club).permit :name, :description, :logo, :image,
      :notification, :tag_list
  end

  def load_club
    @club = Club.find_by id: params[:id]
    unless @club
      flash[:danger] = t "club_manager.cant_fount"
      redirect_to club_manager_path
    end
  end

  def manager_club
    correct_manager = manager_of_club(current_user).find_by club_id: params[:id]
    unless correct_manager
      flash[:danger] = t "not_correct_manager"
      redirect_to club_manager_path
    end
  end

  def load_organization
    @organization = Organization.find_by id: @club.organization_id
    unless @organization
      flash[:danger] = t("not_found_organization")
      redirect_to request.referrer
    end
  end
end
