class UsersController < ApplicationController
    before_action :hide_sidebar, only: [:new, :login]

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params) 
        if @user.save
            session[:user_id] = @user.id
            redirect_to profile_path(@user), notice: 'Usuário criado com sucesso!'
        else 
            flash[:alert] = 'Erro, crie novamente um usuário'
            render :new
        end
    end 

    def profile
        @user = current_user
    end

    def login 
    end

    private 

    def hide_sidebar
        @hide_sidebar = true
    end

    def user_params
        params.require(:user).permit(:email, :password_digest, :user_name, :real_name)
    end
end
