class Turma < ActiveRecord::Base
  belongs_to :estudante
  belongs_to :curso
end
