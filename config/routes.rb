Rails.application.routes.draw do

# dynamic pages

get '/welcome/:user_first_name', to: 'dynamic_pages#welcome'

# static pages

get '/team', to: 'static_pages#team'

get '/contact', to: 'static_pages#contact'

# ---

resources :gossips

# get '/home', to: 'static_pages#home'

# get '/potin/:gossip_id', to: 'static_pages#potin', as:'potin'

# ---

resources :users

# get '/profil/:author_id', to: 'static_pages#profil', as:'profil'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
