Rails.application.routes.draw do
  # Devise routes for user authentication, using custom registrations controller
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Nested resources: Banks have many accounts
  resources :banks, only: [:show] do
    resources :accounts, except: [:show]  # Allows all actions except :show (index, new, create, edit, update, destroy)
  end

  # Root path points to banks#show (or adjust as needed based on your structure)
  root to: 'banks#show'
end
