Rails.application.routes.draw do
  
  root 'home#index'

  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine => '/swagger'

  resources :authors
  resources :books

end
