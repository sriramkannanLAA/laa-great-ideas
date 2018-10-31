Rails.application.routes.draw do
  resources :ideas do
    post 'submit', to: 'ideas#submit'
  end
  devise_for :users
  resources :users, only: [:index, :show] do
    post 'toggle_admin', to: 'users#toggle_admin'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Set up default root
  root to: "ideas#index" 


end
