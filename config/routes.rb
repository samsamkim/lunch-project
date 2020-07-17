Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticate :admin do
    resources :courses, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :courses, only: [:index, :show]

end
