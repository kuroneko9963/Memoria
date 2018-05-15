Rails.application.routes.draw do
  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'

  root 'static_pages#top'
  resources :users
end
