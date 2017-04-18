Rails.application.routes.draw do
  root 'posts#index'

  get 'posts/new' => 'posts#new'
  post 'new_post' => 'posts#new_post'
  get 'get_post' => 'posts#get_post'
  get 'users/:id' => 'users#show'
  post 'users' => 'users#create'
  delete 'logout' => 'sessions#destroy'
  post 'login' => 'sessions#create'
end
