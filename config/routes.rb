Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      post 'sign_in', to: 'authentication#create'
      resources :projects do
        resources :tasks do
          member do
            patch :position
            patch :complete
          end
          resources :comments
        end
      end
    end
  end
end
