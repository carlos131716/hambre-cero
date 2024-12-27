class MenusController < ApplicationController
    before_action :authorize_donador
    before_action :set_menu, only: [:index, :show, :add_plato_to_menu, :eliminar_plato]


    def index
         # Asegúrate de que @menu esté definido
        @menu = current_user.menus.last || Menu.create(user: current_user)
        @platos = Plato.all # O ajusta para obtener los platos que desees
    end

    def show
    # Verifica si se encuentra el menú para el día
    if @menu
        @platos = @menu.platos # Recupera los platos asociados con este menú
        else
        flash[:alert] = "No se ha encontrado un menú para el día de hoy."
        redirect_to menus_path # O redirige a donde prefieras si no hay menú
        end
    end

    
    def create
        @menu = current_user.menus.create(menu_params)
        if @menu.save
          redirect_to menus_path, notice: "Menú creado exitosamente."
        else
          render :new
        end
    end

    def add_plato_to_menu
        plato = Plato.find(params[:plato_id])
        cantidad = params[:cantidad].to_i
    
        # Verificar si el plato ya está en el menú
        menu_plato = @menu.menu_platos.find_by(plato_id: plato.id)
        if menu_plato
          menu_plato.update(cantidad: menu_plato.cantidad + cantidad)
        else
          @menu.menu_platos.create(plato_id: plato.id, cantidad: cantidad)
        end
    
        redirect_to menus_path, notice: 'Plato agregado al menú.'
    end

    def eliminar_plato
        plato = Plato.find(params[:plato_id])
        @menu.platos.delete(plato)
        redirect_to menus_path, notice: 'Plato eliminado del menú.'
    end

    private

    def set_menu
        @menu = current_user.menus.last # O la lógica que uses para obtener el menú del día
    end
    def menu_params
        params.require(:menu).permit(:nombre)
    end
    # Método para verificar que el usuario tiene el rol de donador
    def authorize_donador
        unless current_user&.donador?
        redirect_to login_path, alert: "No tienes permiso para acceder a esta sección."
        end
    end
end