Rails.application.routes.draw do
  root 'members#index'
  resources :members
  resources :groups
  resources :group_members, only: [:index] do
    member do
      get :add_head
    end
  end
end
