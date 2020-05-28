class TimeLineController < ApplicationController
  before_action :require_login, only: [:user_time_line]

  def index
    tl = {}
    days = Chapter.all.map(&:created_at).uniq.sort().reverse
    
    days.each do |day|
      tl[day] = []
      comics = Chapter.where(created_at: day).map(&:comic_id).uniq
      comics.each do |comic|
        tl[day] << Comic.find(comic)
      end
      tl[day] = tl[day].sort_by(&:title)
    end

    render json: tl, status: 200
  end

  def user_time_line
    user_favorites = @current_user.favorites.map(&:comic_id)
    chapters = []
    comics = []
    user_favorites.each do |uf|
      chapters << Chapter.where(comic_id: uf).last
    end
    chapters = chapters.sort_by(&:created_at)

    chapters.each do |chapter|
      comic = Comic.find(chapter.comic_id)
      chapter = chapter.title
      comics << {
        comic: comic,
        chapter: chapter
      }
    end

    render json: comics.last(10), status: 200
  end

end
