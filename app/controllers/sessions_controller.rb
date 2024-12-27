class SessionsController < ApplicationController

    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
  
        if user.admin?
          redirect_to users_path
        elsif user.donador?
          redirect_to menus_path  # o a menus_path
        else
          redirect_to root_path  # o a la página de usuario
        end
      else
        flash.now[:alert] = "Credenciales incorrectas"
        render :new
      end
    end
  def destroy
    session[:user_id] = nil   # Elimina la sesión del usuario
    session[:donador_id] = nil # Elimina la sesión del donador
    redirect_to root_path
  end

end