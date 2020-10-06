Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :sessions, only: [:create]
  namespace 'api' do
    get 'users', to: 'users#index'
    get 'users/:name', to: 'users#show'
    post 'users', to: 'users#create'
    delete 'users/:name', to: 'users#destroy'
    patch 'users/:id', to: 'users#update'

    get 'booking', to: 'bookings#index'
    get 'booking/:id', to: 'bookings#show'
    post 'booking', to: 'bookings#create'
    delete 'booking/:id', to: 'bookings#destroy'
    patch 'booking/:id', to: 'bookings#update'

    get 'conference_room', to: 'conference_rooms#index'
    get 'conference_room/:id', to: 'conference_rooms#show'
    post 'conference_room', to: 'conference_rooms#create'
    delete 'conference_room/:id', to: 'conference_rooms#destroy'
    patch 'conference_room/:id', to: 'conference_rooms#update'
  end
end
