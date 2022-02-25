Rails.application.routes.draw do
  get '/', to: "peeps#homepage"
  
  resources :peeps
end
