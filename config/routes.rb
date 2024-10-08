Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  namespace :api do
    namespace :v1 do
      resources :users, param: :uid, only: %i[index show update]
      patch 'users/:id/increment_hunter_rank', to: 'users#increment_hunter_rank'
      get 'users/current', to: 'users#current'
      resources :quests, only: %i[index show]
      resources :monsters, only: %i[index show]
      resources :guild_cards, param: :uid, only: [:show]
      post 'guild_cards/:uid/increment_defeat_count', to: 'guild_cards#increment_defeat_count'
    end
  end
end
