class CreateCursos < ActiveRecord::Migration[6.0]
  def change
    create_table :cursos do |t|
      t.string :nomeCurso
      t.string :detalhesCurso
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
