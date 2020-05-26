class ChaptersController < ApplicationController
  before_action :set_comic, except: [:show]

  def index
    @chapters = Chapter.where(comic_id: @comic.id)

    render json: @chapters
  end

  def show
    @chapter = Chapter.find(params[:id])
    render json: @chapter
  end

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.comic_id = @comic.id
    @chapter.created_at = Time.now

    if Chapter.where(comic_id: @comic.id).map(&:title).include?(@chapter.title)
      render json: {error: "already exists"}, status: 422
      return nil
    end

    if @chapter.save!
      head :ok
    else
      render json: @chapter.errors, status: 422
    end
  end

  private

  def set_comic
    @comic = Comic.find(params[:comic_id])
  end

  def chapter_params
    params.require(:chapter).permit(:title, :folder)
  end
end
