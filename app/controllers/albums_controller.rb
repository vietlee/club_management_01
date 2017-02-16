class AlbumsController < ClubsController
  before_action :authenticate_user!
  def show
    @album = @club.albums.newest
  end
end
