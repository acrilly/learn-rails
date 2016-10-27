Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Use resourceful route for Contact and Visitor controllers
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  
   # The application root (the home page) is the vistors#new view
   root to: 'visitors#new'
end
