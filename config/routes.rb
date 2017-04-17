Rails.application.routes.draw do
  root 'posts#index'

  post 'users' => 'users#create'
  delete 'logout' => 'sessions#destroy'
  post 'login' => 'sessions#create'
end
