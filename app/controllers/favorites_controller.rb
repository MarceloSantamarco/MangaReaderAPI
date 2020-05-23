class FavoritesController < ApplicationController
    before_action :require_login
    before_action :set_comic, except: [:index, :user_favorites]

    def index
        @favorites = @current_user.favorites

        render json: @favorites
    end

    def user_favorites
        ids = @current_user.favorites.map(&:comic_id)

        @favorites = []

        ids.each do |comic_id|
            @favorites << Comic.find(comic_id)
        end

        render json: @favorites
    end

    def create 
        if @current_user.favorites.where(comic_id: @comic.id).first
            render json: {error: 'Already exists'}, status: 402
            return
        end

        @favorite = @current_user.favorites.new(comic_id: @comic.id)

        if @favorite.save!
            head :ok
        else
            render json: @favorites.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @favorite = @current_user.favorites.where(comic_id: @comic.id)
        @favorite.destroy

        head :ok
    end

    private

    def set_comic
        @comic = Comic.find(params[:comic_id] ||= params[:id])
    end
end
