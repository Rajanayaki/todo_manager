class SessionsController < ApplicationController
    before_action :ensure_user_logged_in
    def new
    end

    def create
        user= User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:cuurent_user_id] = user.id
            redirect_to "/"
        else
            render plain: "You have entered incorrect"
        end
    end

end