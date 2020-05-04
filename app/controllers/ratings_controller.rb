class RatingsController < ApplicationController
    before_action :require_login, except: [:ratings_count]
    before_action :set_comic, except: [:index]

    def index
        @ratings = @current_user.rates

        render json: @ratings
    end

    def ratings_count
        @ratings = Rate.where(comic_id: @comic.id).map(&:rate)
        count = []
        
        5.times do |i|
            count[i+1] = 0
        end

        @ratings.map{ |rate| count[rate]+=1 }

        render json: {one: count[1], two: count[2], three: count[3], four: count[4], five: count[5]}, status: :ok
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
