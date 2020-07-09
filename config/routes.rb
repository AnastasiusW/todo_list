Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      post 'sign_in', to: 'authentication#create'
      resources :projects

    end
  end
end
