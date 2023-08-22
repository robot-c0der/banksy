class SessionsController < ApplicationController
    before_action :redirect_if_authenticated, only: [:create, :new]
    before_action :authenticate_user!, only: [:destroy]

    def create
        @user = User.authenticate_by(email: params[:user][:email].downcase, password: params[:user][:password])
        
        if @user
            if @user.unconfirmed?
                redirect_to new_confirmation_path, alert: "Incorrect email or password"
            elsif @user.authenticate_by(email:params[:user][:password])
                # retrieve the path to send the user to
                after_login_path = session[:user_return_to] || root_path
                login @user
                remember(@user) if params[:user][:remember_me] == "1"
                # redirect the user to where they were before logging in
                redirect_to after_login_path
            else
                flash.now[:alert] = "Incorrect email or password"
                render :new, status: :unprocessable_entity
            end
        else
            flash.now[:alert] = "Incorrect email or password"
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        forget(current_user)
        logout
        redirect_to root_path
    end

    def new
    end
end
