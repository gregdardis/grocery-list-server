Rails.application.routes.draw do

  resources :grocery_lists do
    resources :grocery_items
  end

end
