Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :initial_states do
      get "scoops/:id", action: :scoops_show
  end

  resources :scoops, only: %w[ show ] do
    member do
      resources :perspectives, only: %w[ index ], controller: :scoop_perspectives
      resources :facts, only: %w[ index ], controller: :scoop_facts
    end
  end

  resources :users, only: %w[ show ]

  resources :perspectives, only: %w[ show ] do
    member do
      resources :comments, only: %w[ index create ], controller: :perspective_comments
      resources :votes, only: %w[ create ], controller: :perspective_votes
    end
  end

  resources :facts, only: %w[ show ] do
    member do
      resources :comments, only: %w[ index create ], controller: :fact_comments
      resources :votes, only: %w[ create ], controller: :fact_votes
    end
  end


end
