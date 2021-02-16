class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :nomeUsuario
      t.string :email
      t.string :senha
      t.integer :tipoUsuario

      t.timestamps
    end
  end
end
