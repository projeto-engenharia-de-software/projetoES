class CreateComentarios < ActiveRecord::Migration[6.0]
  def change
    create_table :comentarios do |t|
      t.text :comentario
      t.references :usuario, null: false, foreign_key: true
      t.references :curso

      t.timestamps
    end
  end
end
