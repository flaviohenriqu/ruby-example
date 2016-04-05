class CreateEstudantes < ActiveRecord::Migration
  def change
    create_table :estudantes do |t|
      t.string :nome, length: 45
      t.string :num_registro, length: 45
      t.integer :status

      t.timestamps
    end
  end
end
