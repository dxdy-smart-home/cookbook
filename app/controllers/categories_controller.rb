class CategoriesController < ApplicationController
  def index
    categories = Category.ordered
    render locals: { categories: categories }
  end

  def new
    render locals: { category: Category.new(color: '#000000') }
  end

  def create
    category = Category.new category_params

    if category.save
      redirect_to categories_path, notice: "Категория успешно создана"
    else
      render :new, locals: { category: category }
    end
  end

  def edit
    category = Category.find params[:id]
    render locals: { category: category }
  end

  def update
    category = Category.find params[:id]

    if category.update category_params
      redirect_to categories_path, notice: "Категория успешно обновлена"
    else
      render :edit, locals: { category: category }
    end
  end

  def destroy
    category = Category.find params[:id]
    category.destroy

    redirect_to categories_path, notice: "Категория успешно удалена"
  end

  private

  def category_params
    params.require(:category).permit(:name, :color)
  end
end
