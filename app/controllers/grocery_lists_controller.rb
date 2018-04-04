class GroceryListsController < ApplicationController

  # (GET) get all grocery lists
  # PATH: /grocery_lists
  def index
    @grocery_lists = GroceryList.all
    # status :ok = 200
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
      render json:{
          errors: @grocery_list.errors.full_messages
        },
        status: 422 # unprocessable entity
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
      render json: {
          errors: @grocery_list.errors.full_messages
        },
        status: 404
    end
  end

  # (DELETE) delete specific grocery list by id
  # PATH: /grocery_lists/:id
  def destroy
    @grocery_list = GroceryList.find(params[:id])
    if @grocery_list.destroy
      render status: :ok # 200
    else
      render json: {
          errors: @grocery_list.errors.full_messages
        },
        status: 404
    end
  end

  private
  def grocery_list_params
    params.require(:grocery_list)
      .permit(
        :title,
        :owner,
        :last_modified_by,
        :created_at,
        :last_modified,
        :updated_at
      )
  end
end
