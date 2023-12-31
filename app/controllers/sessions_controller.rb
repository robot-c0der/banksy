class SessionsController < ApplicationController
    before_action :redirect_if_authenticated, only: [:create, :new]
    before_action :authenticate_user!, only: [:destroy]

    def create
        @user = User.authenticate_by(email: params[:user][:email].downcase, password: params[:user][:password])
        
        if @user
            if @user.unconfirmed?
                redirect_to new_confirmation_path, alert: "Incorrect email or password"
            else
                # retrieve the path to send the user to
                after_login_path = session[:user_return_to] || app_path
                active_session = login @user
                remember(active_session) if params[:user][:remember_me] == "1"
                # redirect the user to where they were before logging in
                redirect_to after_login_path
            end
        else
            # flash.now[:alert] = "Incorrect email or password"
            @login_error = true
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        forget_active_session
        logout
        redirect_to root_path
    end

    def new
    end
end
