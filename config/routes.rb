Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  controller :pages do
  end
  resources :cars do
    resources :damages, only: [:new, :create, :edit, :update, :destroy]
    member do
      get 'first_estimation', to: "cars#first_estimation"
      get 'start', to: "cars#start"
      get 'final_validation', to: "cars#final_validation"
      get 'publish', to: "cars#publish_offer"
      get 'final_message', to: "cars#final_message"

    end
  end

  get 'dashboard', to: 'pages#dashboard'

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
