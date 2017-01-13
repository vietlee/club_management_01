class ClubManager::ImagesController < ApplicationController
  before_action :user_signed_in
  before_action :load_image, except: :create
  before_action :load_album, only: :destroy

  def create
    image = Image.new image_params
    if image.save
      flash[:success] = t "club_manager.image.success_create"
    else
      flash_error image
    end
    redirect_to club_manager_club_album_path id: image.album_id
  end

  def destroy
    if @image.destroy
      flash[:success] = t "club_manager.image.deleted"
    else
      flash[:danger] = t "club_manager.image.cant_delete"
    end
    redirect_to club_manager_club_album_path @album.club_id, @album.id
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
    unless @image
      flash[:danger] = t "not_found_album"
      redirect_to club_manager_club_albums_path @album
    end
  end
end
