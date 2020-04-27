class CommentsController < ApplicationController
    before_action :require_login
    before_action :set_comic

    def index
        @comments = @comic.comments

        render json: @comments
    end

    def create
        @comment = @current_user.comments.new(comic_id: @comic.id, text: params[:text])

        if @comment.save!
            head :ok
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    private

    def set_comic
        @comic = Comic.find(params[:comic_id])
    end
end
