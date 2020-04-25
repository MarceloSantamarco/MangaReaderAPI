class SearchController < ApplicationController
  def index
    if params[:comic_name].present? or !params[:comic_name].nil?
      
      comics = Comic.where(title: /.*#{params[:comic_name]}.*/i)
      render json: comics
    elsif params[:author_name].present? or !params[:author_name].nil?

      authors = Author.where(name: /.*#{params[:author_name]}.*/i)
      render json: authors
    elsif params[:genre_name].present? or !params[:genre_name].nil?

      genres = Genre.where(name: /.*#{params[:genre_name]}.*/i)
      render json: genres
    elsif params[:category_name].present? or !params[:category_name].nil?

      categories = Category.where(name: /.*#{params[:category_name]}.*/i)
      render json: categories
    end
  end
end
