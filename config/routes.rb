Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
    
}
  root 'products#index'
  resources :products, only: [:index, :new, :show]
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
end


