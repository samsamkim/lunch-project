Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticate :admin do
    get '/admins', to: 'admins#index'
    resources :courses, except: [:show]
    resources :categories, except: [:show]
  end

end
