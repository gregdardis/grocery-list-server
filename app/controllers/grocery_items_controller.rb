class GroceryItemsController < ApplicationController

  # (GET) get all grocery items for a list
  # PATH: /grocery_lists/:grocery_list_id/grocery_items
  def index
    @grocery_items = GroceryList.find(params[:grocery_list_id]).grocery_items

    # status :ok = 200
    render status: :ok, json: @grocery_items
  end

  # (POST) create new grocery item
  # PATH: /grocery_lists/:grocery_list_id/grocery_items
  def create
    # initializes the GroceryItem with attributes automatically
    # mapped to the respective database columns
    @grocery_item = GroceryItem.new(grocery_item_params)

    @grocery_list_id = params[:grocery_list_id]
    @grocery_item.grocery_list_id = @grocery_list_id

    # saves the model in the database
    if @grocery_item.save
      render json: @grocery_item, status: :created
    else
      render json: {
        errors: @grocery_item.errors.full_messages
      },
      status: 422 #unprocessable entity
    end
  end

  # (GET) get specific grocery item on a grocery list
  # PATH: /grocery_lists/:grocery_list_id/grocery_items/:id
  def show
    @grocery_item = GroceryItem.where(
      grocery_list_id: params[:grocery_list_id],
      id: params[:id]
    )

    render json: @grocery_item
  end

  # (PATCH) update specific grocery item by id
  # PATH: /grocery_lists/:grocery_list_id/grocery_items/:id
  def update
    @grocery_item = GroceryItem.find(params[:id])

    if @grocery_item.update(grocery_item_params)
      render json: @grocery_item
    else
      render json: {
          errors: @grocery_item.errors.full_messages
        },
        status: 404
    end
  end

  # (DELETE) delete specific grocery item by id
  # PATH: /grocery_lists/:grocery_list_id/grocery_items/:id
  def destroy
    @grocery_item = GroceryItem.find(params[:id])
    if @grocery_item.destroy
      render status: :ok # 200
    else
      render json: {
          errors: @grocery_item.errors.full_messages
        },
        status: 404
    end
  end

  private
  def grocery_item_params
    params.require(:grocery_item)
      .permit(
        :name,
        :crossed_off,
        :created_at,
        :updated_at
      )
  end
end
