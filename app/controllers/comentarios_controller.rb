class ComentariosController < ApplicationController
  before_action :set_comentario, only: %i[ show edit update destroy ]
  before_action :require_logged_user

  # GET /comentarios or /comentarios.json
  def index
    @curso = Curso.find(params[:curso_id])
    @comentario = @curso.comentarios
    @usuario = Usuario.find(params[:usuario_id])
  end

  # GET /comentarios/1 or /comentarios/1.json
  def show
  end

  # GET /comentarios/new
  def new
    @usuario = Usuario.find(params[:usuario_id])
    @curso = Curso.find(params[:curso_id])
    @comentario = @curso.comentarios.new
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios or /comentarios.json
  def create
    @usuario = Usuario.find(params[:usuario_id])
    @curso = Curso.find(params[:curso_id])
    @comentario = @curso.comentarios.new(comentario_params)
    @comentario.usuario_id = @current_user.id

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to usuario_curso_comentarios_path(@current_user, @curso), notice: "Comentario adicionado com sucesso." }
        format.json { render :show, status: :created, location: @comentario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarios/1 or /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to usuario_curso_comentario_path, notice: "Comentario was successfully updated." }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1 or /comentarios/1.json
  def destroy
    @comentario.destroy
    respond_to do |format|
      format.html { redirect_to usuario_curso_comentarios_path, notice: "Comentario apagado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comentario_params
      params.require(:comentario).permit(:comentario, :usuario_id, :curso_id)
    end
end
