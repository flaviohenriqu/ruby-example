# encoding:utf-8
class Curso < ActiveRecord::Base
  has_many :turmas
  has_many :estudantes, :through => :turmas

  validates :nome, presence: true, length: { minimum: 2 , maximum: 45}
  validates :descricao, presence: true, length: { minimum: 2 , maximum: 45}
  validates :status, inclusion: { in: [0,1],
                                  message: "%{value} inválido." },
                                  allow_nil: false
end