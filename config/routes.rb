Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      post 'sign_in', to: 'session#create'
      resources :projects do
        resources :tasks  do
          resources :position, only: :update
          resources :complete, only: :update
          resources :comments
        end
      end
    end
  end
end
