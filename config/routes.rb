Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  namespace :api do
    namespace :v1 do
      # resources :users, param: :uid, only: %i[index show update]
      get 'users/current', to: 'users#current'
    end
  end
end
