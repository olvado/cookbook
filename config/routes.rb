Rails.application.routes.draw do

  root to: "recipes#index"

  resources :recipes, only: [:index, :show]

  resources :users, except: [:new], path: :cooks do
    get :favourites, to: "users#favourites"
    resources :recipes do
      post :favourite, on: :member
    end
  end

end
