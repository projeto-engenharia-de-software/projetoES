# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_31_231721) do

  create_table "aulas", force: :cascade do |t|
    t.string "nomeAula"
    t.string "conteudo"
    t.integer "curso_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curso_id"], name: "index_aulas_on_curso_id"
  end

  create_table "comentarios", force: :cascade do |t|
    t.text "comentario"
    t.integer "usuario_id", null: false
    t.integer "curso_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curso_id"], name: "index_comentarios_on_curso_id"
    t.index ["usuario_id"], name: "index_comentarios_on_usuario_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.string "nomeCurso"
    t.string "detalhesCurso"
    t.integer "usuario_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["usuario_id"], name: "index_cursos_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email"
    t.string "senha"
    t.string "nomeUsuario"
    t.integer "tipoUsuario"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "aulas", "cursos"
  add_foreign_key "comentarios", "usuarios"
  add_foreign_key "cursos", "usuarios"
end
