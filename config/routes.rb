Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts

  root :to => 'posts#index'
  get '/auth/:provider/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/users/update_profile', to: 'users#update_profile'
  post '/users/update_profile', to: 'users#save_update'
end
