Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',

    sessions: 'users/sessions',
    passwords: 'users/passwords'
}

  root 'products#index'
  resources :products, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :orders, only: [:new]
  end
  resources :signup, only: [:create] do 
    collection do
      get 'first'
      get 'second'
      get 'third'
      get 'fourth'
      get 'fifth'
      get 'done'
    end
  end

  resources :users, only: [:show, :edit, :update] do
    member do
      get 'profile'
    end
  end


end


