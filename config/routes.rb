Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'home/index'

  resources :listening_lessons do
    resources :submitted_scripts
  end
end
