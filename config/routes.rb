Rails.application.routes.draw do
  devise_for :users
  root to: 'places#index'
  resources :places, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # cloudinary
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
