class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show edit update]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params(:name, :bio))
    redirect_to @artist
  end

  def edit
  end

  def update
    @artist.update(artist_params(:name, :bio))
    redirect_to @artist
  end

  private

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
