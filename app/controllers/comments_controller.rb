class CommentsController < ApplicationController
    before_action :require_login, except: [:index]
    before_action :set_comic, except: [:destroy]

    def index
        @comments = @comic.comments

        @comments.map{|com| com['user'] = {name: com.user.name, email: com.user.email, photo: com.user.photo}}

        render json: @comments
    end

    def create
        @comment = @current_user.comments.new(comic_id: @comic.id, text: params[:text], created_at: Time.now)

        if @comment.save!
            head :ok
        else
            render json: @comment.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy

        head :ok
    end

    private

    def set_comic
        @comic = Comic.find(params[:comic_id])
    end
end
