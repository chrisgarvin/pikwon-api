Rails.application.routes.draw do
  root 'posts#index'

  get 'users/:id' => 'users#show'
  post 'users' => 'users#create'
  delete 'logout' => 'sessions#destroy'
  post 'login' => 'sessions#create'
end
