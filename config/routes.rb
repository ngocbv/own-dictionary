Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'

  get 'home/index'

  resources :listening_lessons do
    resources :submitted_scripts
  end
end
