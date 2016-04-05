# encoding:utf-8
class InicialController < ApplicationController

  before_action :find_matricula, only: [:matricula_curso, :matricular, :cancelar_matricula]

  def index

  end

  def matriculas
    @cursos = Curso.all
  end

  def matricula_curso

  end


  def matricular
    @estudante = Estudante.find(params[:estudante_id])

    unless @curso.estudantes.include? @estudante
      c = Turma.new(estudante: @estudante, curso: @curso, entry_at: Time.now)
      c.save
      find_matricula
      flash.now[:success] = "Matricula efetuada com sucesso!"
    else
      flash.now[:alert] = "Estudante já matriculado"
    end

    render :matricula_curso
  end

  def cancelar_matricula
    @matricula = Turma.where(curso: Curso.find(params[:id]), estudante: Estudante.find(params[:estudante_id])).first
    @matricula.destroy
    flash[:success] = "Matricula cancelada com sucesso!"
    redirect_to :matricula_curso
  end

  private

  def find_matricula
    @curso = Curso.find(params[:id])
    @estudantes = Estudante.where(status: 1) - @curso.estudantes
    @matriculas = Turma.where(curso: @curso)
  end
end