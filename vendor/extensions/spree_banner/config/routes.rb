Spree::Core::Engine.add_routes do
  # Add your extension routes here
  Spree::Core::Engine.routes.draw do
    namespace :admin do
      resources :banners
    end

    namespace :api, defaults: { format: 'json' } do
      namespace :v1 do
        resources :banners, only: [:index]
      end
    end
  end
end
