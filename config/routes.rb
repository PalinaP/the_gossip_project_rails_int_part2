Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
# dynamic pages

get '/welcome/:user_first_name', to: 'dynamic_pages#welcome'

# static pages

get '/team', to: 'static_pages#team'

get '/contact', to: 'static_pages#contact'

# ---

resources :gossips

# ---

resources :comments

# ---

resources :users

# ---

resources :cities

# ---

resources :sessions, only:[:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
