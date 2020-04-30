Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
}
  root 'products#index'
  resources :products, only: [:index, :new, :show]


  resources :signup do
    collection do
      get 'first'
      get 'second'
      get 'third'
      get 'fourth'
      get 'fifth'
      get 'sixth'
      get 'done'

    end
  end
end


