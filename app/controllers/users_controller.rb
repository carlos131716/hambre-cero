class UsersController < ApplicationController
    before_action :authenticate_admin!
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user, notice: 'Usuario creado exitosamente.'
        else
            render :new
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password, :role, :apellido_familia, :numero_integrantes)
    end


end
