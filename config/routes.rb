Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, format: :json do
    resources :categories, only: %i[index]
    resource :menu, only: [] do
      get '/:category_id', to: 'menu#show'
    end
    resources :orders, only: %i[create show]
    resources :order_items, only: %i[create update destroy]
    resources :payments, only: %i[create]
  end
end
