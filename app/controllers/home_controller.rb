class HomeController < ApplicationController
    before_action :authenticate_user!
  
    def index
      # Obtener todos los menús para el usuario
      @menus = Menu.all
    end
  
    def show
      # Obtener el menú seleccionado por el usuario
      @menu = Menu.find(params[:id])
      @platos = @menu.platos
      @user = current_user
      @numero_integrantes = @user.role == 2 ? @user.numero_integrantes : 0
    end

    def recibir
        plato_id = params[:plato_id]
        cantidad_a_recibir = params[:cantidad].to_i
        menu_id = params[:menu_id]  # Obtener el id del menú desde los parámetros de la URL
      
        # Asegúrate de que el menu_id sea válido
        @menu = Menu.find_by(id: menu_id)
        
        if @menu.nil?
          flash[:alert] = "Menú no encontrado."
          redirect_to home_index_path
          return
        end
      
        # Verificar si el usuario ya ha recibido platos hoy
        reservas_hoy = Reserva.where(user_id: current_user.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).sum(:cantidad)
      
        # Verificar si el usuario puede recibir más platos
        if reservas_hoy + cantidad_a_recibir <= current_user.max_platos_por_dia
          # Crear la reserva
          Reserva.create(user: current_user, plato_id: plato_id, cantidad: cantidad_a_recibir)
          flash[:notice] = "Plato(s) recibido(s) exitosamente."
        else
          flash[:alert] = "No puedes recibir más platos hoy. El límite es #{current_user.max_platos_por_dia}."
        end
      
        # Redirigir a la página del menú después de la acción
        redirect_to home_path(@menu.id) # Redirigir usando el id del menú
      end
      
      
  end
  