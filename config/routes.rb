Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get 'merchants/random', to: 'merchants#random'
      get 'merchants/find', to: 'merchants#find'
      get 'merchants/find_all', to: 'merchants#find_all'
      get 'merchants/most_revenue', to: 'merchants#most_revenue'
      get 'merchants/most_items', to: 'merchants#most_items'
      get 'merchants/revenue', to: 'merchants#revenue_by_date'
      get 'merchants/:id/revenue', to: 'merchants#revenue'
      get 'merchants/:id/favorite_customer', to: 'merchants#favorite_customer'
      get 'merchants/:id/customers_with_pending_invoices', to: 'merchants#customers_with_pending_invoices'
      resources :merchants, except: [:new, :edit] do
        resources :items, only: [:index]
        resources :invoices, only: [:index]
      end

      get 'customers/random', to: 'customers#random'
      get 'customers/find', to: 'customers#find'
      get 'customers/find_all', to: 'customers#find_all'
      get 'customers/:id/favorite_merchant', to: 'customers#favorite_merchant'
      resources :customers, except: [:new, :edit] do
        get '/invoices', to: 'customers#invoices'
        get '/transactions', to: 'customers#transactions'
      end

      get 'items/random', to: 'items#random'
      get 'items/find', to: 'items#find'
      get 'items/find_all', to: 'items#find_all'
      get 'items/most_revenue', to: 'items#most_revenue'
      get 'items/most_items', to: 'items#most_items'
      resources :items, except: [:new, :edit] do
        resources :invoice_items, only: [:index]
        get '/merchant', to: 'items#merchant'
      end

      get 'invoices/random', to: 'invoices#random'
      get 'invoices/find', to: 'invoices#find'
      get 'invoices/find_all', to: 'invoices#find_all'
      resources :invoices, except: [:new, :edit] do
        resources :items, only: [:index]
        resources :transactions, only: [:index]
        resources :invoice_items, only: [:index]
        get '/merchant', to: 'invoices#merchant'
        get '/customer', to: 'invoices#customer'
      end

      get 'transactions/random', to: 'transactions#random'
      get 'transactions/find', to: 'transactions#find'
      get 'transactions/find_all', to: 'transactions#find_all'
      resources :transactions, except: [:new, :edit] do
        get '/invoice', to: 'transactions#invoice'
      end

      get 'invoice_items/random', to: 'invoice_items#random'
      get 'invoice_items/find', to: 'invoice_items#find'
      get 'invoice_items/find_all', to: 'invoice_items#find_all'
      resources :invoice_items, except: [:new, :edit] do
        get '/invoice', to: 'invoice_items#invoice'
        get '/item', to: 'invoice_items#item'
      end
    end
  end
end
