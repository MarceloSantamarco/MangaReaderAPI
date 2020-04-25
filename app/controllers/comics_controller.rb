class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :update, :comic_genre, :comic_author, :destroy]

  # GET /comics
  def index
    @comics = Comic.all

    render json: @comics
  end

  # GET /comics/1
  def show
    render json: @comic
  end

  # POST /comics
  def create
    @comic = Comic.new(comic_params)

    @comic.author_id = Author.find_by(name: params[:author])
    @comic.category_id = Category.find(params[:category])

    if @comic.save!
      params[:genres].each do |gen|
        comic_genre = ComicGenre.new(genre_id: Genre.find_by(name: gen).id, comic_id: @comic.id)
        comic_genre.save!
      end
      render json: @comic, status: :created, location: @comic
    else
      render json: @comic.errors, status: :unprocessable_entity
    end
  end

  # GET /comics/1/comic_genre
  def comic_genre
    ids = ComicGenre.where(comic_id: @comic.id).map(&:genre_id)
    genres = []
    ids.each do |id|
      genres << Genre.where(id: id)
    end
    render json: genres.flatten
  end

  def comic_author
    render json: Author.find(@comic.author_id)
  end

  def related_comics
    if params[:genre].present?
      comic_genres = ComicGenre.where(genre_id: Genre.find_by(name: params[:genre]).id)
      comics = []
      comic_genres.each do |cg|
        comics << Comic.where(id: cg.comic_id)
      end
      render json: comics.flatten
    elsif params[:category].present?
      render json: Comic.where(category_id: Category.find_by(name: params[:category]).id)
    elsif params[:author].present?
      render json: Comic.where(author_id: Author.find_by(name: params[:author]).id)
    end
  end

  # PATCH/PUT /comics/1
  def update
    if @comic.update(comic_params)
      render json: @comic
    else
      render json: @comic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comics/1
  def destroy
    @comic.comic_genres.destroy
    @comic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id] ||= params[:comic_id])
    end

    # Only allow a trusted parameter "white list" through.
    def comic_params
      params.require(:comic).permit(:title, :description, :rate, :adult, :published_at, :cover)
    end
end
