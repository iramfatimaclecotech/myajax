Rails.application.routes.draw do
 # get 'homes/index'
  get 'books/index'
  get 'creators/index'
  get 'resources/index'
  namespace :form_validations do
    get 'posts2/index'
  end
  get 'searches/index'
  get 'homes/post'
  get 'homes/post_data'


  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/articles", to: "articles#index"
  # Defines the root path route ("/")
  # root "articles#index
  #get "/searches", to: "searches#index"
  root "posts#index"
  resources :searches
    resources :posts2
    namespace :form_validations do
      resources :posts2
    end

    resources :resources do 
      resources :creators
    end

    resources :books do
      collection do
        get :search
      end
    end

  resources :articles do
    resources :comments
  end
  resources :users do
    resources :posts
  end
  
end
