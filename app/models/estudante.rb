# encoding:utf-8
class Estudante < ActiveRecord::Base
  has_many :turmas
  has_many :cursos, :through => :turmas

  validates :nome, presence: true, length: { minimum: 2 , maximum: 45}
  validates :num_registro, presence: true, length: { minimum: 1 , maximum: 45}
  validates :status, inclusion: { in: [0,1],
                                  message: "%{value} inválido." },
            allow_nil: false
end