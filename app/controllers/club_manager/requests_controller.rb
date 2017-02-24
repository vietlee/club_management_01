class ClubManager::RequestsController < BaseClubManagerController
  before_action :load_member

  def update
    if params[:status].blank?
      member = @member.update_attributes is_manager: true
    else
      member = @member.update_attributes status: params[:status].to_i
    end
    unless member
      flash[:danger] = t("error_process")
      redirect_to :back
    end
    flash[:success] = t("success_process")
    redirect_to :back
  end

  private
  def load_member
    @member = UserClub.find_by id: params[:id]
    unless @member
      flash[:danger] = t "club_manager.cant_fount"
      redirect_to club_manager_path
    end
  end
end
