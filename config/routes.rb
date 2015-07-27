Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'merchants/random', to: 'merchants#random'
      get 'merchants/find', to: 'merchants#find'
      resources :merchants, except: [:new, :edit]

      get 'customers/random', to: 'customers#random'
      get 'customers/find', to: 'customers#find'
      resources :customers, except: [:new, :edit]

      get 'items/random', to: 'items#random'
      get 'items/find', to: 'items#find'
      resources :items, except: [:new, :edit]

      get 'invoices/random', to: 'invoices#random'
      get 'invoices/find', to: 'invoices#find'
      resources :invoices, except: [:new, :edit]

      get 'transactions/random', to: 'transactions#random'
      get 'transactions/find', to: 'transactions#find'
      resources :transactions, except: [:new, :edit]

      get 'invoice_items/random', to: 'invoice_items#random'
      get 'invoice_items/find', to: 'invoice_items#find'
      resources :invoice_items, except: [:new, :edit]
    end
  end
end
