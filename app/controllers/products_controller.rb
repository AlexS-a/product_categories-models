class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = @product.categories
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    category_params[:categories].each do |category|
      if category.length > 0
        @category = Category.find(category.to_i)
        @product.categories << @category
      end
    end
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private
  def category_params
    params[:product].require(:product_categories).permit({categories:[]})
  end

  def product_params
    params.require(:product).permit(:title, :description)
  end
end
