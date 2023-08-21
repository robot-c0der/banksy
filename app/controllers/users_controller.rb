class UsersController < ApplicationController
    before_action :redirect_if_authenicated, only: [:create, :new]
    
    def create
        @user = User.new(user_params)
        if @user.save
            @user.send_confirmation_email!
            redirect_to root_path, notice: "Please check your email for confirmation instructions"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def new
        @user = User.new
    end

    private

    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end

end
