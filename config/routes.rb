Rails.application.routes.draw do

  resources :movies, except: [:new, :edit, :index]
  
  root 'movies#index'

  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "signup" }

  get 'new/movie', to: 'movies#new', as: 'new_movie'
  
  get 'edit/movie/:id', to: 'movies#edit', as: 'edit_movie'

end