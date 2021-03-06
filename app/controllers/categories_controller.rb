class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  def new
    @category = Category.new
    @products = Product.order(created_at: :desc).limit(10)
  end

  def create
    @category = Category.new(category_params)
    product_params[:products_10_most_recently_created].each do |product|
      if product.length > 0
        @product = Product.find(product.to_i)
        @category.products << @product
      end
    end
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private

  def product_params
    params[:category].require(:product_categories).permit({products_10_most_recently_created:[]})
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
