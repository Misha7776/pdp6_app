Rails.application.routes.draw do
  resources :posts do
    collection do
      post :search
    end
  end
  resources :products do
    collection do
      post :search
    end
  end
  resources :people
  root 'home#index'
end
