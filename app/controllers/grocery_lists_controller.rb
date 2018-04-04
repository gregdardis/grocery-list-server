class GroceryListsController < ApplicationController

  # (GET) get all grocery lists
  # PATH: /grocery_lists
  def index
    @grocery_lists = GroceryList.all

    render status: :ok, json: @grocery_lists
  end

  # (POST) create new grocery list
  # PATH: /grocery_lists
  def create
    # initializes a GroceryList with attributes automatically
    # mapped to the respective database columns
    @grocery_list = GroceryList.new(grocery_list_params)

    # saves the model in the database
    if @grocery_list.save
      render json: @grocery_list, status: :created, location: @grocery_list
    else
      render json: @grocery_list.errors, status: :unprocessable_entity
    end
  end

  # (GET) get specific grocery list by id
  # PATH: /grocery_lists/:id
  def show
    @grocery_list = GroceryList.find(params[:id])
    render json: @grocery_list
  end

  # (PATCH) update specific grocery list by id
  # PATH: /grocery_lists/:id
  def update
    @grocery_list = GroceryList.find(params[:id])

    if @grocery_list.update(grocery_list_params)
      render json: @grocery_list
    else
      render json: @grocery_list.errors
    end
  end

  # (DELETE) delete specific grocery list by id
  # PATH: /grocery_lists/:id
  def destroy
    @grocery_list = GroceryList.find(params[:id])
    @grocery_list.destroy
  end

  private
  def grocery_list_params
    params.require(:grocery_list).permit(:title,
                                          :owner,
                                          :last_modified_by,
                                          :created_at,
                                          :last_modified,
                                          :updated_at
                                        )
  end
end
