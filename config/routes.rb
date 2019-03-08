Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :initial_states do
      get "scoops/:id", action: :scoops_show
  end

  resources :scoops, only: %w[ show ] do
    member do
      resources :perspectives, only: %w[ index ]
      resources :facts, only: %w[ index ]
    end
  end

  resources :users, only: %w[ show ]

  resources :perspectives, only: %w[ show ] do
    member do
      resources :comments, only: %w[ index create ]
      resources :votes, only: %w[ create ]
    end
  end

  resources :facts, only: %w[ show ] do
    member do
      resources :comments, only: %w[ index create ]
      resources :votes, only: %w[ create ]
    end
  end


end
