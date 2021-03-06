Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: { format: :json} do
      resources :users, only: %w[show]
      resources :routines, only: %i[index show create update destroy]
      resources :tasks, only: %i[index show create update destroy]
      resources :mesurements, only: %i[create destroy]
      get '/allroutines', to: 'allroutines#index'
      get '/alltasks', to: 'alltasks#index'
    end
  end

  devise_for :users,
    defaults: { format: :json },
    path: 'api/v1/',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
end
