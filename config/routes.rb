Rails.application.routes.draw do
  get 'searches/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/articles", to: "articles#index"
  # Defines the root path route ("/")
  # root "articles#index
  #get "/searches", to: "searches#index"
  root "posts#index"
  resources :searches


  resources :articles do
    resources :comments
  end
  resources :users do
    resources :posts
  end
  
end
