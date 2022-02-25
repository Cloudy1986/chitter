Rails.application.routes.draw do
  get 'peeps/index'
  get '/peeps', to: "peeps#index"
end
