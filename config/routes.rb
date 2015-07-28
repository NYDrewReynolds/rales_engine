Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'merchants/random', to: 'merchants#random'
      get 'merchants/find', to: 'merchants#search'
      get 'merchants/find_all', to: 'merchants#search_all'
      resources :merchants, except: [:new, :edit] do
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end

      get 'customers/random', to: 'customers#random'
      get 'customers/find', to: 'customers#search'
      get 'customers/find_all', to: 'customers#search_all'
      resources :customers, except: [:new, :edit] do
        get '/invoices', to: 'customers#invoices'
        get '/transactions', to: 'customers#transactions'
      end

      get 'items/random', to: 'items#random'
      get 'items/find', to: 'items#search'
      get 'items/find_all', to: 'items#search_all'
      resources :items, except: [:new, :edit] do
        resources :invoice_items, only: [:index]
        get '/merchant', to: 'items#merchant'
      end

      get 'invoices/random', to: 'invoices#random'
      get 'invoices/find', to: 'invoices#search'
      get 'invoices/find_all', to: 'invoices#search_all'
      resources :invoices, except: [:new, :edit] do
        resources :items, only: [:index]
        resources :transactions, only: [:index]
        resources :invoice_items, only: [:index]
        get '/merchant', to: 'invoices#merchant'
        get '/customer', to: 'invoices#customer'
      end

      get 'transactions/random', to: 'transactions#random'
      get 'transactions/find', to: 'transactions#search'
      get 'transactions/find_all', to: 'transactions#search_all'
      resources :transactions, except: [:new, :edit] do
        get '/invoice', to: 'transactions#invoice'
      end

      get 'invoice_items/random', to: 'invoice_items#random'
      get 'invoice_items/find', to: 'invoice_items#search'
      get 'invoice_items/find_all', to: 'invoice_items#search_all'
      resources :invoice_items, except: [:new, :edit] do
        get '/invoice', to: 'invoice_items#invoice'
        get '/item', to: 'invoice_items#item'
      end
    end
  end
end
