class AlbumsController < ClubsController
  def show
    @album = @club.albums.newest
  end
end
