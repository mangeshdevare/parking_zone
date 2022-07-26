Rails.application.routes.draw do
  get 'parking_tickets/index'
  devise_for :parking_lots
  root 'welcome#index'

  resources :parking_lots, only: [:index] do
    collection do
      post :admit_car
      post :exit_car
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
