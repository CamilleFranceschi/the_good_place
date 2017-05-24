Rails.application.routes.draw do

  devise_for :users

  # devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'places#index'
  # resources :users, only: [:show, :udpate]
  resources :places, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reviews, only: [:new, :create]
  end
  # cloudinary
  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
