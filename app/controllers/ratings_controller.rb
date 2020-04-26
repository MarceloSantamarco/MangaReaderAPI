class RatingsController < ApplicationController
    before_action :require_login
    before_action :set_comic, except: [:index]

    def index
        @ratings = @current_user.rates

        render json: @ratings
    end

    def create
        @rating = @current_user.rates.new(comic_id: @comic.id, rate: params[:rate])

        if @rating.save!
            head :ok
        else
            render json: @rating.errors, status: :unprocessable_entity
        end
    end

    private

    def set_comic
        @comic = Comic.find(params[:comic_id])
    end

end
