class MostReadController < ApplicationController

	# GET /most_read
	def index
		@most_read = MostRead.all
		counter = {}

		comic_ids = @most_read.map(&:comic_id)
		comic_ids.uniq.each do |comic_id|
			counter[comic_id] = comic_ids.filter{|x| x == comic_id}.count
		end

		counter = counter.sort.first(5)

		render json: counter, status: :ok
	end
    
	# POST /most_read
	def create
		@most_read = MostRead.new(comic_id: params[:comic_id], user_id: params[:user_id])

		if @most_read.save!
			head :ok
		else
			render json: @most_read.errors, status: :unprocessable_entity
		end
	end

	private

	def most_read_params
		params.require(:most_read).permit(:comic_id, :user_id)
	end
	
end