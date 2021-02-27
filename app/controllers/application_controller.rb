class ApplicationController < ActionController::Base
  protect_from_forgery


  private

  def logged_in?
    current_user.present?
  end

  def current_user
    @current_user ||= session[:usuario_id] && Usuario.find_by_id(session[:usuario_id])
  end

  def is_admin?
    if !current_user.nil? and current_user.tipoUsuario != 1
      redirect_to usuario_path(current_user.id)
    end
  end

  def require_logged_user
    return if logged_in?

    redirect_to login_path, :notice => "É necessario estar logado para acessar"
  end

  public
  def mesmo_usuario(id_1, id_2)
    if id_1.equal?(id_2)
      return true
    else
      return false
    end
  end
  helper_method :mesmo_usuario

end
