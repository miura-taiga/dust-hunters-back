Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  namespace :api do
    namespace :v1 do

      resources :users, param: :uid, only: %i[index show update]
      patch 'users/:uid/increment_hunter_rank', to: 'users#increment_hunter_rank'
      get 'users/current', to: 'users#current'

      resources :quests, only: %i[index show]
      
      resources :monsters, only: %i[index show]
      
      resources :guild_cards, param: :uid, only: [:show]
      patch 'guild_cards/:uid/increment_defeat_count', to: 'guild_cards#increment_defeat_count'
      get 'guild_cards/defeated_records/:uid', to: 'guild_cards#defeated_records'


      resources :user_quests, only: [:create]
      patch 'user_quests/:quest_id/complete', to: 'user_quests#complete'
      get 'user_quests/defeated_records/:uid', to: 'user_quests#defeated_records'
    end
  end
end
