class Subs < ApplicationController
    before_action :ensure_logged_in!

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        if sub.save
            redirect_to sub_url(@sub)
        else
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update_attribute(sub_params)
            redirect_to sub_url(@sub)
        else
            render :edit
        end
    end

    def destroy
        @sub = Sub.find(params[:id])
        if @sub
            @sub.delete
            redirect_to subs_url
        else
            redirect_to sub_url(@sub)
        end
    end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end