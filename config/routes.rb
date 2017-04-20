Rails.application.routes.draw do
  post 'new_post' => 'posts#new_post'
  get 'get_post' => 'posts#get_post'
  get 'get_user/:id' => 'users#get_user'
  post 'login' => 'sessions#create'
end
