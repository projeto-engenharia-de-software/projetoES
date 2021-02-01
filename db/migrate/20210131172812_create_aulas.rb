class CreateAulas < ActiveRecord::Migration[6.0]
  def change
    create_table :aulas do |t|
      t.string :nomeAula
      t.string :conteudo
      t.references :curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
