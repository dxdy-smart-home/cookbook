class ProductsController < ApplicationController
  def index
    products = Product.includes(:categories)
    grouped_products = products.each_with_object(Hash.new(SortedSet.new)) do |product, hash|
      product.categories.each { |category| hash[category] |= [product] }
      hash
    end

    render locals: { grouped_products: grouped_products }
  end

  def new
    render locals: { product: Product.new, categories: categories_resource }
  end

  def create
    product = Product.new product_params

    if product.save
      redirect_to products_path, notice: "Продукт успешно создан"
    else
      render :new, locals: { product: product, categories: categories_resource }
    end
  end

  def edit
    product = Product.find params[:id]
    render locals: { product: product, categories: categories_resource }
  end

  def update
    product = Product.find params[:id]

    if product.update product_params
      redirect_to products_path, notice: "Продукт успешно обновлен"
    else
      render :edit, locals: { product: product, categories: categories_resource }
    end
  end

  def destroy
    product = Product.find params[:id]
    product.destroy

    redirect_to products_path, notice: "Продукт успешно удален"
  end

  private

  def categories_resource
    @categories_resource ||= Category.ordered
  end

  def product_params
    params.require(:product).permit(:name, category_ids: [])
  end
end
