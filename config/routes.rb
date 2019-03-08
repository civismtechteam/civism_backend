Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints format: :json do
    namespace :initial_states do
        get "scoops/:id", action: :scoops_show
    end

    resources :scoops, only: %i[ show ] do
      member do
        resources :perspectives, only: %i[ index ], controller: :scoop_perspectives
        resources :facts, only: %i[ index ], controller: :scoop_facts
      end
    end

    resources :users, only: %i[ show ]

    resources :perspectives, only: %i[ show ] do
      member do
        resources :comments, only: %i[ index create ], controller: :perspective_comments
        resources :votes, only: %i[ create ], controller: :perspective_votes
      end
    end

    resources :facts, only: %i[ show ] do
      member do
        resources :comments, only: %i[ index create ], controller: :fact_comments
        resources :votes, only: %i[ create ], controller: :fact_votes
      end
    end
  end

end
