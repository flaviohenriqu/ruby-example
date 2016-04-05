class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.references :estudante, index: true
      t.references :curso, index: true
      t.datetime :entry_at

      t.timestamps
    end
  end
end
