# frozen_string_literal: true

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  namespace :dashboard do
    root "dashboard#index"

    resources :animals
    resources :animal_groups,
      except: [:show].freeze,
      path: "animal-groups"

    namespace :stock do
      resources :stock_lists, path: "stock-lists" do
        resources :stock_list_placements,
          path: "stock-list-placements",
          except: %i[show index].freeze
      end
    end

    namespace :scheduling do
      resources :schedules do
        resources :schedule_items,
          path: "schedule-items",
          except: %i[show index].freeze
      end
    end
  end
end
