class AulasController < ApplicationController
  before_action :set_aula, only: %i[ show edit update destroy ]
  before_action :require_logged_user

  # GET /aulas or /aulas.json
  def index
    @curso = Curso.find(params[:curso_id])
    @aulas = @curso.aulas
  end

  # GET /aulas/1 or /aulas/1.json
  def show
  end

  # GET /aulas/new
  def new
    @usuario = Usuario.find(params[:usuario_id])
    @curso = @usuario.cursos.find(params[:curso_id])
    @aula = @curso.aulas.new
  end

  # GET /aulas/1/edit
  def edit
  end

  # POST /aulas or /aulas.json
  def create
    @curso = Curso.find(params[:curso_id])
    @aula = @curso.aulas.new(aula_params)

    respond_to do |format|
      if @aula.save
        format.html { redirect_to usuario_curso_aulas_path, notice: "Aula was successfully created." }
        format.json { render :show, status: :created, location: @aula }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aulas/1 or /aulas/1.json
  def update
    respond_to do |format|
      if @aula.update(aula_params)
        format.html { redirect_to @aula, notice: "Aula was successfully updated." }
        format.json { render :show, status: :ok, location: @aula }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aulas/1 or /aulas/1.json
  def destroy
    @aula.destroy
    respond_to do |format|
      format.html { redirect_to usuario_curso_aulas_path, notice: "Aula was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aula
      @aula = Aula.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aula_params
      params.require(:aula).permit(:nomeAula, :conteudo, :curso_id)
    end
end
