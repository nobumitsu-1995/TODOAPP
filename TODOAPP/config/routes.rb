Rails.application.routes.draw do
  get 'users/new' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/login_form' => 'users#login_form'
  post 'users/login' => 'users#login'
  post 'users/logout' => "users#logout"
  get 'users/:id' => "users#show"
  get 'users/:id/edit' => "users#edit"
  post 'users/:id/update' => "users#update"
  post 'users/:id/delete' => "users#delete"

  get 'posts/index' =>"posts#index"
  get 'posts/index_none' =>"posts#index_none"
  get 'posts/index_over' =>"posts#index_over"
  get 'posts/new' => "posts#new"
  post 'posts/create' => "posts#create"
  get 'posts/:id' => "posts#show"
  get 'posts/:id/edit' => "posts#edit"
  post 'posts/:id/update' => "posts#update"
  post 'posts/:id/delete' => "posts#delete"

  get 'completions/index' => "completions#index"
  post 'completions/:id/return' => "completions#return"
  get 'completions/:id' => "completions#show"
  post 'completions/:id/delete' => "completions#delete"
  post 'completions/:id/complete' => "completions#complete"

  get '/' => "home#top"
  get '/about' => "home#about"
end
