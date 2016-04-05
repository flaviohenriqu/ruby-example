class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome, length: 45
      t.string :descricao, length: 45
      t.integer :status

      t.timestamps
    end
  end
end
