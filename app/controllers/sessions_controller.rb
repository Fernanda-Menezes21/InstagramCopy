class SessionsController < ApplicationController

    def create
        user = User.find_by(user_id: params[:id])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logado com sucesso"
        if flash.now[:alert] = "Email ou senha inválidos"
            render :login
        end
    end

    def destroy 
        session.find_by(user_id: params[:user_id]) = nil
        redirect_to login_path, notice: "Logout feito com sucesso"

    end

end
