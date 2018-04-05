class GroceryList < ApplicationRecord
  has_many :grocery_items, dependent: :destroy
end
