class CommentsController < ApplicationController
    before_action :ensure_logged_in!

    def new
        @comment = Comment.new
        render :new
    end

    def create
        @comment = Comment.new(post_params)

        if comment.save
            redirect_to post_url(@comment)
        else
            render :new
        end
    end

    private

    def post_params
        params.require(:comment).permit(:title, :url, :content)
    end
end
end
