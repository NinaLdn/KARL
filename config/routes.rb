Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  controller :pages do
    # get 'start'
  end
  resources :cars do
    member do
      get 'first_estimation', to: "cars#first_estimation"                      # collection => no restaurant id in URL
      get 'start', to: "cars#start"  # RestaurantsController#top
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
