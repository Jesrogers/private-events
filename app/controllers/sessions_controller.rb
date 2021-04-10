class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by username: params[:username]
        puts params[:username]

        if user
            session[:current_user_id] = user.id
            flash[:notice] = "Login Successful!"
            redirect_to root_path
        else
            flash.now.alert = "No user with that name exists!"
            render :new
        end
    end

    def destroy
        session[:current_user_id] = nil
        redirect_to root_path
    end
end