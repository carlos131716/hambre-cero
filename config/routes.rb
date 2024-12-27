Rails.application.routes.draw do
   # Ruta raíz
  root 'home#index'  # Redirige al index del HomeController por defecto
  resources :home, only: [:index, :show]
  post 'home/:menu_id/recibir', to: 'home#recibir', as: 'recibir_plato'
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :platos
  resources :menus do
    post 'add_plato_to_menu', on: :member
    post 'generar_menu', on: :member
    delete 'eliminar_plato', on: :member
  end
  delete 'session', to: 'sessions#destroy', as: 'session'
  resources :reservas

end
