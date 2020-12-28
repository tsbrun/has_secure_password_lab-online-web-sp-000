class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create 
        @user = User.find_by(name: params[:user][:name])&.authenticate(params[:user][:password])
        if @user 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end
    end
end

# for some reason, instead of logging in, I keep creating new users
# probably something wrong with the form