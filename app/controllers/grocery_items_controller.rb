class GroceryItemsController < ApplicationController

  # (GET) get all grocery items for a list
  # PATH: /grocery_lists/:grocery_list_id/grocery_items
  def index
    @grocery_items = GroceryItem.all

    render status: :ok, json: @grocery_items
  end

  # (POST) create new grocery item
  # PATH: /grocery_lists/:grocery_list_id/grocery_items
  def create
    # initializes the GroceryItem with attributes automatically
    # mapped to the respective database columns
    @grocery_item = GroceryItem.new(grocery_item_params)

    # saves the model in the database
    if @grocery_item.save
      render json: @grocery_item, status: :created, location: @grocery_item
    else
      render json: @grocery_item.errors, status: :unprocessable_entity
    end
  end

  # (GET) get specific grocery item on a grocery list
  # PATH: /grocery_lists/:grocery_list_id/grocery_items/:id
  def show

  end

  # (PATCH) update specific grocery item by id
  # PATH: /grocery_lists/:grocery_list_id/grocery_items/:id
  def update

  end

  # (DELETE) delete specific grocery item by id
  # PATH: /grocery_lists/:grocery_list_id/grocery_items/:id
  def destroy

  end

  private
  def grocery_item_params
    params.require(:grocery_item)
      .permit(
        :grocery_list_id,
        :name,
        :crossed_off,
        :created_at,
        :updated_at
      )
  end
end
