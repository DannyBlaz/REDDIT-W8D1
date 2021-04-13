class UsersController < ApplicationController
    before_action :ensure_logged_in!, only: [:show, :index]
    # skip_before_action :verify_authenticity_token

    def index
        @users = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        # debugger
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # debugger
            login!(@user)
            redirect_to users_url
        else
            # debugger
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attribute(user_params)
            redirect_to user_url(@user)
        else
            flash.now[:errros] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        render :new
    end

    private

    def user_params
        # debugger
        params.require(:user).permit(:username, :password)
    end
end