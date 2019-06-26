Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # namespace :api do
  #   namespace :v1 do
  #
  #     end
  #   end
  # end

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'
      end
      resources :search, only: [:index, :show]
    end
  end
end
