Rails.application.routes.draw do
  root 'members#index'
  resources :members
  resources :groups
  resources :group_members, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
