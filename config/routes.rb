Rails.application.routes.draw do

  resources :usuarios do
    resources :cursos do
      resources :comentarios
      resources :aulas
    end
  end

  controller :sessions do
    get  "/login",  :action => :new,     :as => :login
    post "/login",  :action => :create,  :as => false

    get  "/logout", :action => :destroy, :as => :logout
  end

  root 'sessions#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
