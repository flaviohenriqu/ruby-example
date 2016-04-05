class EstudantesController < ApplicationController

  before_action :find_estudante, only: [:edit, :update]

  def index
    @estudantes = Estudante.all
  end

  def new
    @estudante = Estudante.new
  end

  def create
    @estudante = Estudante.new(estudante_params)
    if @estudante.save
      flash[:success] = "Estudante cadastrado!"
      redirect_to @estudante
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @estudante.update_attribute(estudante_params)
      flash[:success] = "Estudante atualizado!"
      redirect_to @estudante
    else
      render 'edit'
    end
  end

  def destroy
    Estudante.find(params[:id]).destroy
    flash[:success] = "Estudante deletado!"
    redirect_to estudantes_url
  end

  private

  def find_estudante
    @estudante = Estudante.find(params[:id])
  end

  def estudante_params
    params.require(:estudante).permit(:nome, :num_registro, :status)
  end

end