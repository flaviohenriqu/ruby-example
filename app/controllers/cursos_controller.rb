class CursosController < ApplicationController

  before_action :find_curso, only: [:edit, :update]

  def index
    @cursos = Curso.all
  end

  def show
    @curso = Curso.find(params[:id])
    @estudantes = @curso.estudantes
  end

  def new
    @curso = Curso.new
  end

  def create
    @curso = Curso.new(curso_params)
    if @curso.save
      flash[:success] = "Curso cadastrado!"
      redirect_to @curso
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @curso.update_attributes(curso_params)
      flash[:success] = "Curso atualizado!"
      redirect_to @curso
    else
      render 'edit'
    end
  end

  def destroy
    Curso.find(params[:id]).destroy
    flash[:success] = "Curso deletado!"
    redirect_to cursos_url
  end

  private

  def find_curso
    @curso = Curso.find(params[:id])
  end

  def curso_params
    params.require(:curso).permit(:nome, :descricao, :status)
  end

end