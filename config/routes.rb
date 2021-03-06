Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/paintings/:id/colors', to: 'paintings#colors'
  resources :paintings, only: [:index, :show, :create, :update]
  resources :user_paintings, only: [:index, :create]

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users, only: [:index, :create]
        post '/login', to: 'auth#create'
        get '/profile', to: 'users#profile'
        get '/timeline', to: 'users#timeline'
      end
    end
  end

end
