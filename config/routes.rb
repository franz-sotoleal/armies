Rails.application.routes.draw do
  resources :armies do
    resources :units do
      post "train", action: :train
      post "transform", action: :transform
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
