class ApplicationController < ActionController::Base
  before_action :set_current_user

  helper_method :current_user, :admin?, :donador?

  def set_current_user
    Current.user = current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_donador
    @current_donador ||= Donador.find(session[:donador_id]) if session[:donador_id]
  end

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def authenticate_donador!
    redirect_to login_path unless current_donador
  end

  def authenticate_admin!
    redirect_to root_path  unless admin?
  end

  def admin?
    current_user&.admin?
  end

  def donador?
    current_user&.donador?
  end
end
