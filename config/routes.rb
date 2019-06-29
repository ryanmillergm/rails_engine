Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        get '/:id/items', to: 'merchant_items#index'
        get '/:id/invoices', to: 'merchant_invoices#index'
      end
      namespace :customers do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        # get '/:id/items', to: 'customer_items#index'
        get '/:id/invoices', to: 'customer_invoices#index'
        get '/:id/transactions', to: 'transactions#index'
      end
      namespace :invoices do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        # get '/:id/items', to: 'invoice_items#index'
        # get '/:id/invoices', to: 'invoice_invoices#index'
      end
      namespace :items do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
        # get '/:id/items', to: 'item_items#index'
        # get '/:id/items', to: 'item_items#index'
      end
      namespace :invoice_items do
        get '/:id/item', to: 'items#show'
      end

      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
