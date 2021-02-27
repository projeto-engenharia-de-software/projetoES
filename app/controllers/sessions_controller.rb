class SessionsController < ApplicationController
  def index
  end

  def new

  end

  def buscar_usuario_logar
    @usuario = Usuario.find_by_email_and_senha(params[:email], params[:senha])
  end

  def create
    reset_session

    @usuario = buscar_usuario_logar

    if @usuario
      session[:usuario_id] = @usuario.id
      redirect_to usuario_path(@usuario), :notice => "Logado com sucesso"
    else
      flash.now[:notice] = "Usuario ou Senha incorretos, tente novamente."
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end