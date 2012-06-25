class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_name(params[:session][:name])
        if user && user.authenticate(params[:session][:password])
            sign_in user
            redirect_to admin_path
        else
            flash.now[:error] = 'Invalid name/password combination'
            render 'new'
        end
    end

    def destroy
    end
end
