Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints format: :json do
    namespace :initial_states do
        get "scoops/:id", action: :scoops_show
    end

    resources :scoops, only: %i[ index show ] do
      member do
        resources :perspectives, only: %i[ index ], controller: "scoops/perspectives"
        resources :facts, only: %i[ index ], controller: "scoops/facts"
      end
    end

    resources :users, only: %i[ show ]

    resources :perspectives, only: %i[ show ] do
      member do
        resources :comments, only: %i[ index create ], controller: "perspectives/comments"
        resources :votes, only: %i[ create ], controller: "perspectives/votes"
      end
    end

    resources :facts, only: %i[ show ] do
      member do
        resources :comments, only: %i[ index create ], controller: "facts/comments"
        resources :votes, only: %i[ create ], controller: "facts/votes"
      end
    end

  end

end
