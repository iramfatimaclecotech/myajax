Rails.application.routes.draw do
  get 'appointments/index'
  get 'patients/index'
  get 'physicians/index'
  resources :sharks
  get 'endangered/index'
  get 'endangered/data', to: 'endangered#data'
  post 'endangered/upload', to: 'endangered#upload'
  post 'endangered/destroy', to: 'endangered#destroy'



  get 'reviews/index'
  get 'cards/index'
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
  #root "posts#index"
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

  resources :cards do
    resources :reviews
  end

  resources :patients 

  root "patients#index"
  #get "/physicians", to: "physicians#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :patients do
    resources :physicians 
      resources :appointments
  end
  
  
end
