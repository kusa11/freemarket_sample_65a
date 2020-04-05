Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:index, :new]

  resources :signup do
    collection do
      get 'first'
      get 'second'
      get 'third'

    end
  end


end


