Rails.application.routes.draw do

  resources :cursos
  resources :usuarios do
    resources :comentarios
    resources :cursos
  end
  resources :cursos do
    resources :aulas
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
