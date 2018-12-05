Rails.application.routes.draw do
  get 'page/dashboard'
  devise_for :users
  root to: 'pages#home'
  controller :pages do
    # get 'start'
  end
  resources :cars do
    member do
      get 'first_estimation', to: "cars#first_estimation"                      # collection => no restaurant id in URL
      get 'start', to: "cars#start"  # RestaurantsController#top
      # get 'exact_km', to: "cars#exact_km"
      # get 'pictures', to: "cars#pictures"
      # get 'why_selling', to: "cars#why_selling"
      get 'final_validation', to: "cars#final_validation"
      get 'final_message', to: "cars#final_message"
      get 'dashboard', to: 'cars#dashboard'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
