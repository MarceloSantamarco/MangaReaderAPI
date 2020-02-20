class ComicsController < ApplicationController
  before_action :set_comic, only: [:show, :update, :destroy]

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

    if @comic.save
      render json: @comic, status: :created, location: @comic
    else
      render json: @comic.errors, status: :unprocessable_entity
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
    @comic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comic_params
      params.require(:comic).permit(:title, :description, :rate, :parental_rate, :published_at, :category_id, :genre_id, :author_id, :comic_file_name, :comic_content_type, :comic_file_size, :cover, :comic_path)
    end
end
