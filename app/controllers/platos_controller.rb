class PlatosController < ApplicationController
    before_action :authorize_donador
    def index
        @Platos = Plato.all
    end
  
    def new
      @plato = Plato.new
    end
  
    def create
      @plato = Plato.new(plato_params)
      if @plato.save
        redirect_to platos_url, notice: "PLATO REGISTRADO EXITOSAMENTE"
      else
        render :new, status: :unprocessable_entity, alert: t('.alert')
      end
    end
  
    def show
      @plato = plato
    end
  
    def edit
      @plato = plato
    end
  
    def update
      @plato = plato
      if @plato.update(plato_params)
        redirect_to platos_url, notice: "PLATO ACTUALIZADO EXITOSAMENTE"
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @plato = Plato.find(params[:id])
      @plato.destroy
      redirect_to platos_url, notice: "PLATO ELIMINADO EXITOSAMENTE"
    end
  
    private
  
    def plato
      @plato = Plato.find(params[:id])
    end
  
    private

    def plato_params
    params.require(:plato).permit(:name_comida)
    end

    # Método para verificar que el usuario tiene el rol de donador
    def authorize_donador
        unless current_user&.donador?
        redirect_to root_path, alert: "No tienes permiso para acceder a esta sección."
        end
    end
  end
  