# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  namespace :dashboard do
    root "dashboard#index"

    resources :animal_groups, except: [:show].freeze
    resources :animals
  end
end
