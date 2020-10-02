Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :sessions, only: [:create]
  namespace 'api' do
    get 'users', to: 'users#index'
    get 'users/:name', to: 'users#show'
    post 'users', to: 'users#create'
    delete 'users/:name', to: 'users#destroy'
    patch 'users/:name', to: 'users#update'
  end
end
