Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  root 'welcome#index'
  get 'welcome/index'

  get "/dropbox",  :controller => "dropbox", :action => "index"
  get "/dropbox/auth",  :controller => "dropbox", :action => "show"
  get "/dropbox/callback",  :controller => "dropbox", :action => "create"
  get "/dropbox/auth_finish", :controller => "dashboard", :action => "show"

end
