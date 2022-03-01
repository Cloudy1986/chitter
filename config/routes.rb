Rails.application.routes.draw do
  get '/', to: "peeps#homepage"
  
  resources :peeps do
    resources :comments
  end

  get 'sign-up', to: "users#new"
  get 'log-in', to: "sessions#new"
  post 'log-in', to: "sessions#create"
  delete 'log-out', to: "sessions#destroy"
  resources :users, except: [:new]
end
