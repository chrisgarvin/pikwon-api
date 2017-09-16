Rails.application.routes.draw do
  post 'post' => 'posts#create'
  post 'pick' => 'picks#create'
  get 'option/:id/picks' => 'picks#show'
  get 'user/:id' => 'users#show'
  get 'user/:id/global_feed' => 'global_feeds#show'
  get 'user/:id/user_feed' => 'user_feeds#show'
  get 'user/:id/history' => 'user_posts#show'
  get 'relationships/:id' => 'relationships#show'
  post 'signup' => 'users#create'
  post 'login' => 'sessions#create'
  post 'follow/:id' => 'relationships#create'
  post 'unfollow/:id' => 'relationships#destroy'
end
