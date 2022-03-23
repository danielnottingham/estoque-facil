Rails.application.routes.draw do
  root 'home#index'
  resources :business_units
end
