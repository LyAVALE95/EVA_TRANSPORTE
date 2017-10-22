Rails.application.routes.draw do
  resources :travels
  resources :packages
  resources :audits
  resources :type_scaffolds
  resources :loads
  resources :warehouses
  resources :clientcontacts
  resources :customers
  resources :drivers
  #get 'home/index'

  
   authenticated :user do
    root :to => "locations#index"
  end
  root 'home#welcome'
   resources :users_admin, :controller => 'users'
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions"}
 #devise_for :users, controllers: { registrations: "registrations",sessions: "sessions"}
  resource :users_admin , :controller => 'users',only: [:edit] do
      collection do
        patch 'update_password'
      end
  end
#root :to => redirect("menu#index")
  resources :company_lines
  resources :companies
  resources :carrier_lines
  resources :travel_stands
  resources :stands
  resources :trucks
  resources :locations
  resources :mts
  resources :states
  resources :licenses
  resources :rate_expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
