class FavoritesController < ApplicationController
    before_action :require_login
    before_action :set_comic

    def index
        @favorites = @current_user.favorites

        render json: @favorites
    end

    def create 
        @favorite = @current_user.favorites.new(comic_id: @comic.id)

        if @favorite.save!
            head :ok
        else
            render json: @favorites.errors, status: :unprocessable_entity
        end
    end

    def destroy
        binding.pry
        @favorite = @current_user.favorites
    end

    private

    def set_comic
        @comic = Comic.find(params[:comic_id])
    end
end
