Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  #
  match '/movies/:id/director', to: 'movies#similar', :as => :director, via: :get
  #match 'movies/:director' => 'movies#similar', :as => :director
  root :to => redirect('/movies')
  
end
