Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  namespace :api do
    namespace :v1 do
      get 'users/current', to: 'users#current'
    end
  end
end
