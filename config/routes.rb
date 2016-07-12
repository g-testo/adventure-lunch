Rails.application.routes.draw do

  root 'static_pages#home'
  devise_for :users
  resources :lunches
  devise_for :installs
  resources :reviews, only: [:create, :edit, :update]
  get '/past_lunches' => 'lunches#past_lunches'
  get '/contact' => 'static_pages#contact'
  get '/next_lunch' => 'lunches#next_lunch'
end
