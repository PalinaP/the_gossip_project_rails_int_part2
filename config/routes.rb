Rails.application.routes.draw do

# dynamic pages

get '/welcome/:user_first_name', to: 'dynamic_pages#welcome'

# static pages

get '/team', to: 'static_pages#team'

get '/contact', to: 'static_pages#contact'

# ---

resources :gossips do
  resources :comments, controller: 'comments'
end


# ---

resources :users

# ---

resources :cities

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
