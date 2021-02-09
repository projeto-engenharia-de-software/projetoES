class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show edit update destroy ]
  before_action :require_logged_user, only: %i[ index show edit update destroy]
  before_action :id_admin?, only: %i[index]

  # GET /usuarios or /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1 or /usuarios/1.json
  def show
    @current_user
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios or /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to login_path, notice: "Usuario criado com sucesso." }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1 or /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        if @current_user.id == @usuario.id
          @current_user = @usuario
        end
        format.html { redirect_to @usuario, notice: "Usuario atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1 or /usuarios/1.json
  def destroy
    @usuario.destroy
    if !@current_user.nil? and @usuario != nil and @current_user.id == @usuario.id
      :logout
      respond_to do |format|
        format.html { redirect_to login_path, notice: "usuario apagado com sucesso" }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to usuarios_url, notice: "usuario apagado com sucesso" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:email, :senha, :nomeUsuario, :tipoUsuario)
    end
end
