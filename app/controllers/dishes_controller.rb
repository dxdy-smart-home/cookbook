class DishesController < ApplicationController
  helper_method :tags_resource, :products_resource

  def index
    dishes = Dish.includes(:tags)
    grouped_dishes = dishes.each_with_object(Hash.new(SortedSet.new)) do |dish, hash|
      dish.tags.each { |tag| hash[tag] |= [dish] }
      hash
    end

    render locals: { grouped_dishes: grouped_dishes }
  end

  def new
    render locals: { dish: Dish.new }
  end

  def create
    dish = Dish.new dishe_params

    if dish.save
      redirect_to dishes_path, notice: "Блюдо успешно создано"
    else
      render :new, locals: { dish: dish }
    end
  end

  def edit
    dish = Dish.find params[:id]
    render locals: { dish: dish }
  end

  def update
    dish = Dish.find params[:id]

    if dish.update dishe_params
      redirect_to dishes_path, notice: "Блюдо успешно обновлено"
    else
      render :edit, locals: { dish: dish }
    end
  end

  def destroy
    dish = Dish.find params[:id]
    dish.destroy

    redirect_to dishes_path, notice: 'Блюдо успешно удалено'
  end

  private

  def tags_resource
    @tags_resource ||= Tag.dishes.ordered
  end

  def products_resource
    @products_resource ||= Product.ordered
  end

  def dishe_params
    params.require(:dish).permit(
      :name,
      :servings_number,
      :cooking_time,
      :comment,
      tag_ids: [],
      ingredients_attributes: [:id, :product_id, :number, :unit, :_destroy]
    )
  end
end
