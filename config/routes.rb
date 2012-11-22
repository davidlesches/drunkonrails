Drunkonrails::Application.routes.draw do

  resources :blog, only: [:index, :show], controller: "posts", as: "posts"
  match '/tag/:tag' => 'posts#tag', :as => :tag

  root :to => 'posts#index'

  namespace :admin do
    resources :posts, :administrators, :tags, :uploads, :sessions

    match '/login' => 'sessions#new', :as => :login
    match '/logout' => 'sessions#destroy', :as => :logout

    root :to => 'posts#index'
  end

end
