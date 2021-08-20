Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies

  resources :lists do
    resources :bookmarks
  end
  root_to :lists # index
end
