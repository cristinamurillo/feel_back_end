Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/paintings/:id/colors', to: 'paintings#colors'
  resources :paintings, only: [:index, :show, :create]

end
