class ClubManager::ImagesController < ApplicationController
  before_action :user_signed_in
  before_action :load_image, except: :create
  before_action :load_album, only: [:destroy, :create]

  def create
    ActiveRecord::Base.transaction do
      params[:images]["url"].each do |img|
        @album.images.create!(url: img)
        flash[:success] = t("add_images_successfully")
      end
      redirect_to club_manager_club_album_path id: @album.id
    end
  rescue
    flash[:danger] = t("error_in_process")
    redirect_to :back
  end

  def destroy
    if @image.destroy
      flash[:success] = t "club_manager.image.deleted"
    else
      flash[:danger] = t "club_manager.image.cant_delete"
    end
    redirect_to club_manager_club_album_path id: @album.id, club_id: @album.club_id
  end

  private
  def image_params
    params.require(:image).permit :name, :url, :user_id, :album_id
  end

  def load_image
    @image = Image.find_by id: params[:id]
    unless @image
      flash[:danger] = t "not_found_image"
      redirect_to club_manager_club_album_path @album
    end
  end

  def load_album
    @album = Album.find_by id: params[:album_id]
    unless @album
      flash[:danger] = t "not_found_album"
      redirect_to root_path
    end
  end
end
