class SessionsController < ApplicationController
    before_action :required_logged_out, only: [:new,:create]
    def new
        @user = User.new
        render :new
    end

    def create  
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            log_in_user!(@user)
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    def destroy
        logout
        redirect_to new_session_url
    end

end
