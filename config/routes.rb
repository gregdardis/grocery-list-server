Rails.application.routes.draw do
  devise_for :users
  resources :grocery_lists do
    resources :grocery_items
  end

  # root to: home#index or some root url for devise?
end
