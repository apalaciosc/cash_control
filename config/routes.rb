Rails.application.routes.draw do
  resources :cashes
  devise_for :users
  get 'cashes/index' => 'cashes#index'
  get 'home/index'
   root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
