ChatApp::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :messages
  resources :users do
    collection do
      post :publish
    end
  end
  resources :sessions
  root to: 'home#index'
end
