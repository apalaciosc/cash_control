Rails.application.routes.draw do
  devise_for :users
  resources :cashes, except: [:show]
  get 'cashes/index' => 'cashes#index'
  get 'cashes/entry' => 'cashes#entry'
  get 'cashes/egress' => 'cashes#egress'
  get 'home/index'
 
  patch '/users/:id', to: 'users#update_profile'

  resources :users do
    collection do
      get 'edit_profile'
    end
  end
   root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
