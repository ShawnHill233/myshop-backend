Spree::Core::Engine.add_routes do
  # Add your extension routes here
  Spree::Core::Engine.routes.draw do
    namespace :admin do
      resources :banners
    end

    namespace :api, defaults: { format: 'json' } do
      namespace :v1 do
        resources :index, only: [:index]
        resources :banners, only: [:index]
        resources :brands, only: [:show]
      end
    end
  end
end
