Rails.application.routes.draw do
  get '/', to: "peeps#homepage"
  get '/peeps', to: "peeps#index"
end
