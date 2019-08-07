class UsersController < ApplicationController
    before_action :required_logged_in, only: [:index, :show]
    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find_by(params[:email])
        render :show
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            log_in_user!(@user)
            render :show
        else
            render json:@user.errors.full_messages, status: 422
        end
    end



    private
    def user_params
        params.require(:user).permit(:email, :password, :password_digest,:session_token)
    end
end
