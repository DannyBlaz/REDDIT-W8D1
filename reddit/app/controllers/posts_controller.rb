class PostsController < ApplicationController
    before_action :ensure_logged_in!

    def index
        @posts = Post.all
        render :index
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)

        if post.save
            redirect_to post_url(@post)
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
        render :edit
    end

    def update
        @post = Post.find(params[:id])
        @post.author_id = params[:author_id]

        if @post.update_attribute(post_params)
            redirect_to post_url(@post.author_id)
        else
            render :edit
        end
    end

    def destroy
        @post = Post.find(params[:id])
        
        if @post
            @post.delete
            redirect_to posts_url
        else
            redirect_to post_url(@post)
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end

end