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
    #root :to => "travels#index"
    root :to => "companies#mycompany"
  end
  root 'home#welcome'


  
   resources :users_admin, :controller => 'user'
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions"}
 #devise_for :users, controllers: { registrations: "registrations",sessions: "sessions"}
  resource :users_admin , :controller => 'users',only: [:edit] do
      collection do
        patch 'update_password'
      end
  end
#root :to => redirect("menu#index")
  #get 'users' => 'users#myuser'
  get 'login' => 'home#login'
  get 'companies' => 'companies#mycompany'
  get 'user' => 'user#index'
  get 'users' => 'users#myuser'
  post'users_admin/new' => 'user#create'
  post 'users_admin/:id/edit' => 'user#update_none'
  #delete 'users' => 'users#myuser'


  resources :company_lines
  resources :companies
  resources :carrier_lines
  resources :travel_stands
  resources :stands
  resources :trucks
  resources :locations
  resources :m_ts
  resources :states
  resources :licenses
  resources :rate_expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
