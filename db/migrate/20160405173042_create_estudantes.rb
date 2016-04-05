class CreateEstudantes < ActiveRecord::Migration
  def change
    create_table :estudantes do |t|

      t.timestamps
    end
  end
end
