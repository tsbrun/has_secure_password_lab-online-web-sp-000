class UsersController < ApplicationController
    def create 
        # @user = User.create(name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
        # if @user.password == @user.password_confirmation
        #     session[:user_id] = @user.id
        # else
        #     redirect_to :action => "new"
        # end

        @user = User.new(name: params[:user][:name], password: params[:user][:password])
        @user.password_confirmation = params[:user][:password_confirmation]
        if @user.save 
            session[:user_id] = @user.id 
        else
            redirect_to :action => "new"
        end
    end
end